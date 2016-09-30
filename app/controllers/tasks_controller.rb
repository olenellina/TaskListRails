class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @mytask = Task.find(params[:id].to_i)
  end

  def new
    @mytask = Task.new
  end

  def create
    @mytask = Task.new
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
