class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]
  def index
    @parents = Parent.all
  end

  def new
    @parent = Parent.new
    @parent.student = Student.find(params[:student_id])
  end

  def edit
    @parent = Parent.find(params[:id])
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      flash[:notice]="Parent was successfully created"
      redirect_to student_path(@parent.student.id)
    else
      render :new
    end
  end

  def show

  end

  def update
    if @parent.update(parent_params)
      redirect_to student_path(@parent.student.id), notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    old_student_id = @parent.student.id
    @parent.destroy
    redirect_to student_path(old_student_id), notice: 'Parent was successfully deleted.'
  end

  private def parent_params
    params.require(:parent).permit(:name, :email, :password, :student_id)
  end

  private def set_parent
    @parent = Parent.find(params[:id])
  end
end
