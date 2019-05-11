require "rails_helper"

feature "Create a new task_list" do
  let(:task_list) { FactoryBot.create(:task_list) }

  before(:each) do
    user = User.find(task_list.user_id)
    sign_in user
  end

  scenario "Add a new task_list successfully" do
    access_to_new_tasksLists()
    fill_in "task_list[title]", with: task_list.title
    click_on("Create Task list")
    expect(page).to have_current_path(task_lists_path)
    expect(page).to have_content(task_list.title)
  end

  scenario "Add a new task_list title field empty" do
    access_to_new_tasksLists()
    fill_in "task_list[title]", with: ""
    click_on("Create Task list")
    expect(page).to have_content("Title can't be blank")
  end

  def access_to_new_tasksLists
    visit root_path
    click_link "To Do Lists"
    click_link "New List"
    expect(page).to have_current_path(new_task_list_path)
  end
end
