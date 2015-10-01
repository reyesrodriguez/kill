class UsersController < ApplicationController
 before_action :authenticate, only: [:show]
	def index
		@users = User.all
	end

	def new
  		@user = User.new
	end

	def create
		@user = User.new(user_params)
  		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to Task Manager!"
			MyMailer.welcome_email(@user).deliver_now
			Messaging.create(user_id: @user.id, message_id: Message.first.id);
  			redirect_to @user
		else	
			render 'new'
  		end
  	end
  	
  def show
  	if params[:id].to_i == current_user.id
	  	@user = User.find(params[:id])
	  	@tasks = @user.tasks
	  	@messages = @user.messages

	  	if params[:search]
	  		# filter
	  		
 			@tasks = @user.tasks.where("lower(#{params[:search_by]}) LIKE lower(?)", "%#{params[:search].downcase}%")
		end
	else
		
		redirect_to users_path
	end
  end

private

	def user_params
		params[:user][:email] = params[:user][:email].downcase
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end


end




