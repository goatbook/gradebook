class TeachersController < ApplicationController
  #before_action :check_logged_in
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = "Welcome to your page!"
      redirect_to teachers_path, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  def show
    redirect_to edit_teacher_path(@teacher)
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to teachers_path, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password )
  end

  def make_session(teacher)
    session[:teacher_id] = teacher.id
    session[:name] = "Jane Doe"
  end


  def check_logged_in
    if session[:teacher_id].blank?
      redirect_to teacher_path
    end
  end
end
