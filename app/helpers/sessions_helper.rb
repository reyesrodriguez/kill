module SessionsHelper

	def current_user
  		User.find(session[:user_id]) if session[:user_id]
	end

  def logged_in?
    !current_user.nil?
  end

	def authenticate
		if current_user.nil?
			redirect_to login_path
  	end
  end

end