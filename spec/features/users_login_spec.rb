require 'rails_helper'
require 'database_cleaner'

RSpec.feature "Log in", type: :feature do
  scenario "will let a user log in" do
    sign_up
    expect(page).to have_content("User was successfully created.")

    log_in
    expect(current_path).to eq("/users/#{user_id}/posts")
  end

  scenario "will raise an error if login details are incorrect" do
    sign_up
    expect(page).to have_content("User was successfully created.")

    visit "/login"
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "password420"
    click_button "login"
    expect(page).to have_content("Email or password is invalid")
  end

  scenario "will let an existing user edit their details" do
    sign_up
    expect(page).to have_content("User was successfully created.")

    click_link "Edit"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "qwerty"
    fill_in "user_password_confirmation", with: "qwerty"
    click_button "Update User"
    expect(page).to have_content("User was successfully updated.")
  end

  scenario "will raise an error if edited user details do not match" do
    sign_up
    expect(page).to have_content("User was successfully created.")

    click_link "Edit"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "qwerty"
    fill_in "user_password_confirmation", with: "qwertyuiop"
    click_button "Update User"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "will let a logged in user log out" do
    sign_up
    expect(page).to have_content("User was successfully created.")

    log_in
    expect(current_path).to eq("/users/#{user_id}/posts")

    click_button "Logout"
    expect(current_path).to eq("/")
  end

end
