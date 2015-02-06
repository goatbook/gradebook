class ParentsLoginController < ApplicationController
  def login
    if request.post?
      parent = Parent.find_by_email(params[:email])
      if parent && parent.authenticate(params[:password])
        session[:parent_id] = parent.id
        flash[:notice] = "Welcome!"
        redirect_to parents_path
      else
        flash.now[:notice] = "Nice try, hacker"
      end
    end
  end

  def logout
    session[:teacher_id] = nil
    redirect_to parents_login_login_path
  end
end
