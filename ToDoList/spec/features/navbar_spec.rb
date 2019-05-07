require "rails_helper"

feature "navbar" do
  let(:user) { FactoryBot.create(:user) }
  scenario "navbar no user singed in" do
    sign_out user
    visit root_path
    expect(page).to have_css("nav.navbar.navbar-expand-lg.navbar-dark.bg-dark")
    expect(page).to have_css("ul.navbar-nav.mr-auto")
    expect(page).to have_css("li.nav-item.active")
    expect(page).to have_css("div.nav-link.font-weight-bold")
    expect(page).to have_content("Welcome to To Do List")
    expect(page).to have_css("a.nav-link.btn.btn-outline-success")
    expect(page).to have_css("a", :text => "Sign In")
    expect(page).to have_selector(:css, 'a[href="/users/sign_in"]')
  end

  scenario "navbar user singed in" do
    sign_in user
    visit root_path
    expect(page).to have_css("nav.navbar.navbar-expand-lg.navbar-dark.bg-dark")
    expect(page).to have_css("img.rounded-circle")
    expect(page).to have_css("ul.navbar-nav.mr-auto")
    expect(page).to have_css("div.navbar-brand.mx-2.text-white", :text => user.username)
    expect(page).to have_css("li.nav-item", :count => 3)
    expect(page).to have_selector(:css, 'a[href="/profiles"]')
    expect(page).to have_selector(:css, 'a[href="/task_lists"]')
    expect(page).to have_selector(:css, 'a[href="/task_lists.pdf"]')
    expect(page).to have_css("a.nav-link.btn.btn-outline-danger")
    expect(page).to have_css("a", :text => "Sign Out")
    expect(page).to have_selector(:css, 'a[href="/users/sign_out"]')
  end
end
