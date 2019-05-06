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
    expect(page).to have_content("Sesión iniciada")
  end
end
