class StudentsLoginController < ApplicationController
  def login
    if request.post?
      student = Student.find_by_email(params[:email])
      if student && student.authenticate(params[:password])
        session[:student_id] = student.id
        flash[:notice] = "Welcome!"
        redirect_to students_path
      else
        flash.now[:notice] = "Nice try, hacker"
      end
    end
  end

  def logout
    session[:student_id] = nil
    redirect_to students_login_login_path
  end
end
