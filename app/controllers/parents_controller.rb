class ParentsController < ApplicationController
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
      redirect_to parents_path
    else
      render :new
    end
  end

  def show
    redirect_to edit_parent_path(@parent)
  end

  def update
    @parent = Parent.find(params[:id])
  end

  def destroy
    @parent = Parent.find(params[:id])
  end

  private def parent_params
    params.require(:parent).permit(:name, :email, :password, :student_id)
  end
end
