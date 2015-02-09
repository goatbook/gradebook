class GradesController < ApplicationController
  #before_action :check_logged_in
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def index
    @current_student = Student.where(grade_id: session[:grade_id]).all
    @grades = Grade.all
  end

  def new
    if session[:user_type] == "teacher"
      @grade = Grade.new
    else
      redirect_to root_path, notice: 'You cannot see that page.'
    end
  end

  def edit
    if session[:user_type] == "teacher"
      @grade = Grade.find(params[:id])
    else
      redirect_to root_path, notice: 'You cannot see that page.'
    end
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      flash[:success] = "Welcome to your page!"
      redirect_to grades_path, notice: 'Grade was successfully created.'
    else
      render :new, notice: 'Your grade was not saved. Please try again.'
    end
  end

  def show
  end

  def update
    if @grade.update(grade_params)
      redirect_to grades_path, notice: 'Grade was successfully updated.'
    else
      render :edit, notice: 'Your update was not saved. Please try again.'
    end
  end

  def destroy
    if session[:user_type] == "teacher"
      @grade.destroy
      redirect_to grades_url, notice: 'Grade was successfully destroyed.'
    else
      redirect_to grades_path, notice: 'You cannot see that page.'
    end
  end

  private
  def set_grade
    @grade = Grade.find(params[:id])
    # session[:grade_id] = Grade.find(params[:id])
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
