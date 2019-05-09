require "rails_helper"

feature "edit task" do
  before(:each) do
    @task = Task.first
    @task_list = TaskList.find(@task.task_list_id)
    @user = User.find(@task_list.user_id)
    sign_out @user
    sign_in @user
  end
  scenario "Edit a task description successfully" do
    access_to_taks()
    path_task = "/task_lists/#{@task_list.id}/tasks/#{@task.id}/edit"
    find_link(href: path_task).click
    expect(page).to have_current_path(edit_task_list_task_path(@task_list.id, @task.id))
    fill_in "task[description]", with: "New task title"
    click_on("Save")
    expect(page).to have_current_path(task_list_path(@task_list.id))
    expect(page).to have_css("li", :text => "New task title")
  end

  scenario "Edit a task description empty field" do
    access_to_taks()
    path_task = "/task_lists/#{@task_list.id}/tasks/#{@task.id}/edit"
    find_link(href: path_task).click
    expect(page).to have_current_path(edit_task_list_task_path(@task_list.id, @task.id))
    fill_in "task[description]", with: ""
    click_on("Save")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "Mark a task as completed" do
    access_to_taks()
    path_task = "/task_lists/#{@task_list.id}/tasks/#{@task.id}/edit"
    find_link(href: path_task).click
    expect(page).to have_current_path(edit_task_list_task_path(@task_list.id, @task.id))
    check("task[completed]")
    click_on("Save")
    expect(page).to have_current_path(task_list_path(@task_list.id))
    expect(page).to have_css("li", :class => "list-group-item-success")
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
