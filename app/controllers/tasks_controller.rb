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
    @mytask.completed = params[:task][:competed]
    @mytask.save
  end

  def edit
    @mytask = Task.find(params[:id])
  end

  def update
    @mytask = Task.find(params[:id])
    @mytask.title = params[:title]
    @mytask.description = params[:description]
    @mytask.completed = params[:completed]
    @mytask.save
  end

  def destroy
  end

end
