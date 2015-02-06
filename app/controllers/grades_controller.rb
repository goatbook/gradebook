class GradesController < ApplicationController
  #before_action :check_logged_in
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def create
    @grade = Grade.new(teacher_params)
    if @grade.save
      flash[:success] = "Welcome to your page!"
      redirect_to grades_path, notice: 'Grade was successfully created.'
    else
      render :new
    end
  end

  def show
    redirect_to edit_grade_path(@grade)
  end

  def update
    if @grade.update(grade_params)
      redirect_to grades_path, notice: 'Grade was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grade.destroy
    redirect_to grades_url, notice: 'Grade was successfully destroyed.'
  end

  private
  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:date, :description, :score, :student_id )
  end

  def make_session(grade)
    session[:grade_id] = grade.id
    session[:name] = "Jane Doe"
  end


  def check_logged_in
    if session[:grade_id].blank?
      redirect_to grade_path
    end
  end
end
