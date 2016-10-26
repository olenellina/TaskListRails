class TasksController < ApplicationController

  before_action :find_user
  before_action :find_task, only: [:show, :edit, :update, :complete]

  def index
    @tasks = Task.where("user_id = ?", @user.id).to_a
  end

  def show
  end

  def new
    @mytask = Task.new
  end

  def create
    @mytask = Task.new
    @mytask.user_id = @user.id.to_i
    @mytask.title = params[:task][:title]
    @mytask.description = params[:task][:description]
    @mytask.completed = false
    @mytask.save

    # For better user experience, users are redirected home after action
    return redirect_to action: 'index'
  end

  def edit
  end

  def update
    @mytask.title = params[:task][:title]
    @mytask.description = params[:task][:description]
    @mytask.completed = params[:task][:completed]

    # If a task is marked as completed, completed_at is updated to the current Date & Time
    if @mytask.completed == true
      @mytask.completed_at = DateTime.now
    end

    @mytask.save

    redirect_to action: 'index'
  end

  def destroy
    Task.find(params[:id]).destroy

    redirect_to action: 'index'
  end

  # When called, complete marks that tasks' complete status as true and sets the
  # completed_at value to the current date/time.
  def complete
    @mytask.completed = true
    @mytask.completed_at = DateTime.now
    @mytask.save

    redirect_to action: 'index'
  end

end

private

def find_task
  @mytask = Task.find(params[:id])

  if @mytask.user_id != @user.id
    flash[:notice] = "Record not found in this user's account"
    return redirect_to tasks_index_path
  end

end

def find_user
  if session[:user_id] == nil
    flash[:notice] = "You must be logged in to complete that action"
    return redirect_to root_path
  else
    @user = User.find_by(id: session[:user_id].to_i)
  end
end
