class TaskListsController < ApplicationController
  before_action :require_login

  def create
    @task_list = TaskList.new(title: params[:task_list][:title])
    @task_list.user_id = current_user.id
    if @task_list.save
      redirect_to task_lists_path
    else
      render :new
    end
  end

  def destroy
    @task_list = TaskList.find(params[:id])
    @task_list.delete
    redirect_to task_lists_path
  end

  def edit
    @task_list = TaskList.find(params[:id])
  end

  def index
    @todo_lists = TaskList.where(user_id: current_user.id)
    @todo_list_task = get_list_pdf()
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "task_lists/task_lists", pdf: "Task_lists", layout: "pdf.html" }
    end
  end

  def new
    @task_list = TaskList.new
  end

  def show
    @task_list = TaskList.find(params[:id])
    @tasks = Task.where(task_list_id: @task_list.id)
  end

  def update
    @task_list = TaskList.find(params[:id])
    @task_list.update(title: params[:task_list][:title])
    if @task_list.save
      redirect_to task_lists_path
    else
      render :edit
    end
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to profiles_path
    end
  end

  def get_list_pdf
    @todo_lists = TaskList.where(user_id: current_user.id).to_a #Obtiene las listas del usuario
    list_and_tasks = {}
    @todo_lists.each do |lista|
      tasks_descriptions = Task.joins(:task_list).where(task_list_id: lista.id).pluck(:description)
      list_and_tasks[lista.title] = tasks_descriptions
    end
    return list_and_tasks
  end
end

#Query para obtener lista y tareas pendientes
#tasks_descriptions = Task.joins(:task_list).where(task_list_id: lista.id, completed: false).pluck(:description)
