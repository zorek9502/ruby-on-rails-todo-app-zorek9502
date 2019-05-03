class TodosWeeklyReportMailer < ApplicationMailer
  def todos_report(user, todo_report)
    @todo_list_task = todo_report
    mail to: user.email, subject: "Pending Tasks"
  end
end
