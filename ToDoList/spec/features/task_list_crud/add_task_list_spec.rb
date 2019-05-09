require "rails_helper"

feature "Create a new task_list" do
  let(:user) { FactoryBot.create(:user) }
  let(:task_list) { FactoryBot.create(:task_list) }
  scenario "Add a new task_list successfully" do
    sign_in user
    visit root_path
    click_link "To Do Lists"
    click_link "New List"
    expect(page).to have_current_path(new_task_list_path)
    fill_in "task_list[title]", with: task_list.title
    click_on("Create Task list")
    expect(page).to have_current_path(task_lists_path)
    expect(page).to have_content(task_list.title)
  end

  scenario "Add a new task_list title field empty" do
    sign_in user
    visit root_path
    click_link "To Do Lists"
    click_link "New List"
    expect(page).to have_current_path(new_task_list_path)
    fill_in "task_list[title]", with: ""
    click_on("Create Task list")
    expect(page).to have_content("Title can't be blank")
  end
end
