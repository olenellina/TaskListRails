class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.all
    @mytask = nil

    @tasks.each do |task|
      number = params[:id].to_i
      if task[:id] == number
        @mytask = task
      end
    end

    if @mytask == nil
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
