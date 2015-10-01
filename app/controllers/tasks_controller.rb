class TasksController < ApplicationController
# authentication callback before action, no authentication required to the excepts ones
 # before_action :authenticate, except: [:index]

  before_action :authenticate

#GET /tasks

# GET /tasks

  def index
    
    if current_user.id
      @user = User.find(current_user.id)
      @tasks = @user.tasks
      @messages = @user.messages
    else
      redirect_to users_path
    end
  end

  def new
    @task = Task.new
    @user = User.new
  end

# GET /tasks/new
  def create

     # for validation for required field if the input is not valid redirect to the create new form, 
     @task = Task.new(task_params)

     if @task.save
        Tasking.create({user_id: current_user.id, task_id: @task.id })
        current_user.id
        flash[:success] = "Task had been saved sucessfully."
        redirect_to current_user

     else
        flash[:danger] = "Task not saved. Required fields are incomplete."
        redirect_to new_task_path
     end
  end


# GET /tasks/:id - show task
  def show
    @task = Task.find(params[:id]) 
    @taskUsers = @task.users

    # weather API
    state = @task.state
    state.gsub(" ", "%20")
    city = @task.city
    city.gsub(" ", "%20")
    response = HTTParty.get("http://api.wunderground.com/api/4a9cdbbd8fedfdc6/conditions/q/#{state}/#{city}.json")
 
    @weather_day = response["current_observation"]["temp_f"]
    @weather_feel = response["current_observation"]["weather"]
    @weather_condition = response["current_observation"]["feelslike_f"]
    # if @weather_condition.include? "Partly cloudy"
    #   @weather_img = "http://icons-ak.wxug.com/i/c/k/partlycloudy.gif"
    # elsif @weather_condition.include? "cloudy"
    #   @weather_img = "http://icons.wxug.com/i/c/k/cloudy.gif"
    # elsif @weather_condition.include? "Clear"
    #   @weather_img = "http://icons-ak.wxug.com/i/c/k/clear.gif"
    # elsif @weather_condition.include? "Light rain"
    #   @weather_img = "http://icons.wxug.com/i/c/k/chancerain.gif"
    # elsif @weather_condition.include? "Rain"
    #   @weather_img = "http://icons-ak.wxug.com/i/c/k/rain.gif"
    # elsif @weather_condition.include? "Drizzle"
    #   @weather_img = "http://icons.wxug.com/i/c/k/chancerain.gif"
    # elsif @weather_condition.include? "Thunderstorm"
    #   @weather_img = "http://icons.wxug.com/i/c/k/chancetstorms.gif"
    # elsif @weather_condition.include? "sleet"
    #   @weather_img = "http://icons.wxug.com/i/c/k/sleet.gif"
    # elsif @weather_condition.include? "Snow"
    #   @weather_img ="http://icons.wxug.com/i/c/k/chancesnow.gif"
    # elsif @weather_condition.include? "fog"
    #   @weather_img ="http://icons.wxug.com/i/c/k/fog.gif"    
    # elsif @weather_condition.include? "hazy"
    #   @weather_img ="http://icons.wxug.com/i/c/k/fog.gif"  
    # end

    # handle invitation send out
    @users = User.all
    # send out inviation if params[:recipients] exists
    if params[:recipients]
        @recipients = params[:recipients][0].split(",")
        title = "Invitation to join task: "+@task.title
        content = "<p>"+current_user.name+" invites you to join a task, do you accept?<p>"+
                "<a class='btn btn-success' href='/acceptinvite/"+@task.id.to_s+"' >Accept</a><br>"  
        @newMessage = Message.create({title: title, content: content, sender_id: current_user.id})
        @recipients.each do |recipient|
          Messaging.create({user:User.find_by_email(recipient),message:@newMessage})
        end
        flash[:success] = "Invitation sent."
        redirect_to current_user
    end  

  end

  # accept invitation route
  def acceptinvite
    if Task.exists?(:id => params[:id])
      if Tasking.find_by_user_id_and_task_id(current_user.id,params[:id])
        flash[:info] = "You have joined the task already"
      else
        Tasking.create({user:current_user,task:Task.find(params[:id])})
        flash[:success] = "Task has been added to your task list."      
      end
    else
        flash[:danger] = "Task has been removed."
    end
    redirect_to current_user
  end

# GET /tasks/:id/edit
  def edit
    @task = Task.find(params[:id])
  end

# POST
  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to current_user
  end


# DELETE /tasks/:id
  def destroy
    # double confirmetion for the delete
    task = Task.find(params[:id])

    # delete taskings first
    @taskings = task.taskings
    @taskings.each do |tasking|
      tasking.destroy
    end

    # then delete task
    task.destroy

    flash[:info] = "Task has been deleted"
    redirect_to current_user
  end


  private
  def task_params
    params.require(:task).permit(:title, :content, :duedate, :image, :state, :address, :city)
  end

  # def tasking_params
  #   params.require(:tasking).permit(:user_id, :task_id)
  # end
end
