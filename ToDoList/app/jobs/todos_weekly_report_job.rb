class TodosWeeklyReportJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    #todos_report = TodosWeeklyReport.generate(user)
    todos_report = generate(user)
    TodosWeeklyReportMailer.todos_report(user, todos_report).deliver_now
  end

  private

  def generate(user)
    todo_lists = TaskList.where(user_id: user.id).to_a #Obtiene las listas del usuario
    todos_list = {}
    todo_lists.each do |lista|
      tasks_descriptions = Task.joins(:task_list).where(task_list_id: lista.id, completed: false).pluck(:description)
      todos_list[lista.title] = tasks_descriptions
    end
    todos_list
  end
end
