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

    # For better user experience, users are redirected home after a task is updated
    redirect_to action: 'index'
  end

  def destroy
    Task.find(params[:id]).destroy
  end

end
