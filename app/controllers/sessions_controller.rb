class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # direct to profile page
      session[:user_id] = user.id
      redirect_to user
    else
      # create error msg
      if user == nil
        flash[:danger] = "User does not exists"
      else
        flash[:danger] = "Incorrect password"
      end
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(users_path)
  end

end