class TeachersController < ApplicationController
  #before_action :check_logged_in
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @session_teacher = Teacher.find(session[:teacher_id])
    @all_students = Student.where(teacher_id: session[:teacher_id]).all
    @teachers = Teacher.all
    # @all_students = Student.all_students.where(teacher_id: session[:teacher_id])
  end

  def new
    @teacher = Teacher.new
  end

  def edit
  #   @teacher = Teacher.find(params[:id])
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
    redirect_to teachers_url, notice: 'Teacher was successfully deleted.'
  end



  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
    
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end

  def make_session(teacher)
    session[:teacher_id] = teacher.id
    session[:name] = teacher.name
  end

  def check_logged_in
    if session[:teacher_id].blank?
      redirect_to teacher_path
    end
  end
end
