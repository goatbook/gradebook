class WelcomeController < ApplicationController
  def index
    @all_students = Student.all_students
  #   @parent = Parent.new
  #   @grade = Grade.new
  #   @edit_grade = Grade.find(params[:id])
  #   @delete_grade = @grade.destroy
  end
end
