class StudentsController < ApplicationController
  #before_action :check_logged_in
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Welcome to your page!"
      redirect_to teachers_path, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to students_path, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :password, :teacher_id )
  end

  def make_session(student)
    session[:student_id] = student.id
    session[:name] = "Jane Doe"
  end


  def check_logged_in
    if session[:student_id].blank?
      redirect_to student_path
    end
  end
end
