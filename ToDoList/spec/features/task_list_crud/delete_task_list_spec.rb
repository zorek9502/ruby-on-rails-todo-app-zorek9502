require "rails_helper"

feature "Delete task list" do
  before(:each) do
    offset = rand(TaskList.count)
    @task_list = TaskList.offset(offset).first
    @title = @task_list.title
    @user = User.find(@task_list.user_id)
    sign_out @user
    sign_in @user
    visit root_path
  end
  scenario "Delete a task list successfully" do
    click_link "To Do Lists"
    expect(page).to have_css("h1", :text => "#{@user.username} To Do Lists")
    path = "/task_lists/#{@task_list.id}"
    find_link(href: path).click
    expect(page).to have_current_path(task_list_path(@task_list.id))
    expect(page).to have_css("h1", :text => @task_list.title)
    click_link "Delete"
    expect(page).to have_current_path(task_lists_path)
    expect(page).not_to have_content(@title)
  end
end
