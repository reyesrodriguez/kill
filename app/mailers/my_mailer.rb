class MyMailer < ActionMailer::Base
	default :from => ENV['EMAIL_USER_NAME']

	def welcome_email(user)
		@user = user
		@url = "http://localhost:3000/login"
		mail(:to => @user.email, :subject => 'Welcome to TaskApp!')
	end
end