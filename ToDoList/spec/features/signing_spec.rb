require "rails_helper"

feature "signing in" do
  let(:user) { FactoryBot.create(:user) }

  def fill_in_signin_fields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Log in"
  end

  scenario "visiting the site to sign in" do
    visit root_path
    click_link "Log In"
    fill_in_signin_fields
    expect(page).to have_content("Signed in successfully")
  end

  scenario "sign in with a non valid user" do
    visit root_path
    click_link "Log In"
    fill_in "user[email]", with: "notanuser@example.com"
    fill_in "user[password]", with: "Holamundo321"
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password")
  end
end
