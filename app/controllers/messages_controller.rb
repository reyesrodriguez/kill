class MessagesController < ApplicationController

	before_action :authenticate

	def index
		@user = current_user
		@messages = @user.messages
	end

	def new
		# @user = User.search(params[:search], params[:email])
		# @user = User.find(params[:user_id])
		@message = Message.new
		@messaging = Messaging.new
		@users = User.all
	end

	def create
		# @user = User.find(params[:user_id])
		#user_id refers to the recipient id 
		@message = Message.new(message_params)

		if @message.save
			@recipients = params[:recipients].split(",")
			@recipients.each do |recipient|
				messaging = Messaging.new
				Messaging.create({user:User.find_by(:email => recipient),message:@message})
			end

			flash[:success] = "Message sent successfully."

			@user = current_user
			@messages = @user.messages
			render "index"
		else
			flash[:danger] = "Errors occur when creating message."
			render "new"
		end

	end

	def show
		@user = current_user
		@message = Message.find(params[:id])
		@sender = @message.sender_id
	end

	def destroy
		@messaging = Messaging.find_by_user_id_and_message_id(current_user.id,params[:id])
		@messaging.delete
		flash[:warning] = "Message deleted."
		redirect_to messages_path
	end

	private
	def message_params
		params
		.require(:message)
		.permit(:title,:content, :attachment)
		.merge({sender_id: current_user.id})
	end

end