require "rails_helper"

feature "Delete task list" do
  before(:each) do
    @task = Task.first
    @description = @task.description
    @task_list = TaskList.find(@task.task_list_id)
    @user = User.find(@task_list.user_id)
    sign_out @user
    sign_in @user
  end

  scenario "Delete a task list successfully" do
    access_to_taks()
    path_task = "/task_lists/#{@task_list.id}/tasks/#{@task.id}/edit"
    find_link(href: path_task).click
    expect(page).to have_current_path(edit_task_list_task_path(@task_list.id, @task.id))
    click_link "Delete"
    expect(page).to have_current_path(task_list_path(@task_list.id))
    expect(page).not_to have_content(@description)
  end

  def access_to_taks
    visit root_path
    click_link "To Do Lists"
    expect(page).to have_css("h1", :text => "#{@user.username} To Do Lists")
    path = "/task_lists/#{@task_list.id}"
    find_link(href: path).click
    expect(page).to have_current_path(task_list_path(@task_list.id))
    expect(page).to have_css("h1", :text => @task_list.title)
  end
end
