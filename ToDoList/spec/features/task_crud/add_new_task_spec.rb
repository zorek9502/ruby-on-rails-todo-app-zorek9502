require "rails_helper"

feature "CRUD Task" do
  let(:task_list) { FactoryBot.create(:task_list) }
  before(:each) do
    @user = User.find(task_list.user_id)
    sign_in @user
  end

  context "Create" do
    scenario "Add a task  successfully" do
      access_to_taks()
      click_on "Add task"
      expect(page).to have_current_path(new_task_list_task_path(task_list.id))
      task_text = Faker::Commerce.product_name
      fill_in "task[description]", with: task_text
      click_on("Create Task")
      expect(page).to have_current_path(task_list_path(task_list.id))
      expect(page).to have_css("li", :text => task_text)
    end
  end

  def access_to_taks
    visit root_path
    click_link "To Do Lists"
    expect(page).to have_css("h1", :text => "#{@user.username} To Do Lists")
    path = "/task_lists/#{task_list.id}"
    find_link(href: path).click
    expect(page).to have_current_path(task_list_path(task_list.id))
    expect(page).to have_css("h1", :text => task_list.title)
  end
end
