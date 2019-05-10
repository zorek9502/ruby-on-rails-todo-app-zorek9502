require "rails_helper"

feature "edit the title of a task list" do
  before(:each) do
    task_list = TaskList.first
    user = User.find(task_list.user_id)
    sign_out user
    sign_in user
    visit root_path
  end
  scenario "Edit the title successfully" do
    click_link "To Do Lists"
    expect(page).to have_css("h1", :text => "#{user.username} To Do Lists")
    expect(page).to have_css("a", :text => "Edit")
    path = "/task_lists/#{task_list.id}/edit"
    find_link(href: path).click
    expect(page).to have_current_path(edit_task_list_path(task_list.id))
    fill_in "task_list[title]", with: "This list have been edited"
    click_on "Save"
    expect(page).to have_css("a", :text => "This list have been edited")
  end

  scenario "Edit the title field empty" do
    click_link "To Do Lists"
    expect(page).to have_css("h1", :text => "#{user.username} To Do Lists")
    expect(page).to have_css("a", :text => "Edit")
    path = "/task_lists/#{task_list.id}/edit"
    find_link(href: path).click
    expect(page).to have_current_path(edit_task_list_path(task_list.id))
    fill_in "task_list[title]", with: ""
    click_on "Save"
    expect(page).to have_content("Title can't be blank")
  end
end
