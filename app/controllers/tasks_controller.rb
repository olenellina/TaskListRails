class TasksController < ApplicationController

  # before_action :find_task only: [:show, :edit, :update, :destroy, :complete]

  def index
    @user = User.find_by(id: session[:user_id].to_i)
    @tasks = Task.where("user_id = ?", @user.id).to_a
  end

  def show
    @mytask = Task.find(params[:id].to_i)
  end

  def new
    @mytask = Task.new
  end

  def create
    @user = User.find_by(id: session[:user_id].to_i)
    @mytask = Task.new
    @mytask.user_id = @user.id.to_i
    @mytask.title = params[:task][:title]
    @mytask.description = params[:task][:description]
    @mytask.completed = false
    @mytask.save

    # For better user experience, users are redirected home after action
    redirect_to action: 'index'
  end

  def edit
    @mytask = Task.find(params[:id])
  end

  def update
    @mytask = Task.find(params[:id])
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
    @mytask = Task.find(params[:id])
    @mytask.completed = true
    @mytask.completed_at = DateTime.now
    @mytask.save

    redirect_to action: 'index'
  end

end

# private

# For security, pulling params and only allowing the use of specified keys
# Needs to be updated for this project (pulled from circulum)
#
# def student_params
#   params.require(:student).permit(:first_name, :last_name)
# end
# Then (changes to update method):
#     def update
#       if @student.update[student_params]
#         redirect_to students_path
#       else
#         render: edit
#       end
#     end

# def find_task
#   @mytask = Task.find(params[:id])
# end
