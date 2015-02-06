class TeachersLoginController < ApplicationController
  def login
    if request.post?
      teacher = Teacher.find_by_email(params[:email])
      if teacher && teacher.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        flash[:notice] = "Welcome!"
        redirect_to parents_path
      else
        flash.now[:notice] = "Nice try, hacker"
      end
    end
  end

  def logout
    session[:teacher_id] = nil
    redirect_to logins_login_path
  end
end
