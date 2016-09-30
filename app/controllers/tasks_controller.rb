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
    @params = params
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

    if @mytask.completed == true
      @mytask.completed_at = DateTime.now
    end

    @mytask.save
    redirect_to action: 'index'
  end

  def destroy
    Task.find(params[:id]).destroy
  end

end
