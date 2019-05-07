require "rails_helper"

feature "Signup" do
  let(:user) { FactoryBot.create(:user) }

  def fill_in_signup_fields(user)
    fill_in "user[email]", with: user.email
    fill_in "user[username]", with: user.username
    fill_in "user[description]", with: user.description
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: user.password
    click_button "Sign up"
  end

  scenario "visiting the site to sign up" do
    sign_out :user
    visit root_path
    click_link "Sign Up"
    fill_in "user[email]", with: Faker::Internet.email
    fill_in "user[username]", with: Faker::Name.name
    fill_in "user[description]", with: Faker::TvShows::GameOfThrones.quote
    fill_in "user[password]", with: "Holamundo123"
    fill_in "user[password_confirmation]", with: "Holamundo123"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "visiting the site to sign up with a created user" do
    sign_out :user
    visit root_path
    click_link "Sign Up"
    fill_in_signup_fields(user)
    expect(page).to have_content("Email has already been taken")
  end
end
