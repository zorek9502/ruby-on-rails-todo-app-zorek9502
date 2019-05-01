class TasksController < ApplicationController
  before_action :require_login

  def create
    @list_id = params[:task_list_id]
    @task = Task.new(description: params[:task][:description])
    @task.task_list_id = @list_id
    if @task.save
      redirect_to task_list_path(@list_id)
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def index
  end

  def new
    @task_list_id = params[:task_list_id]
    @task = Task.new
  end

  def show
  end

  def update
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to profiles_path
    end
  end
end
