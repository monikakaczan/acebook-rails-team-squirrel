require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  # scenario "will let a user log in" do
  #   sign_up
  #   expect(page).to have_content("User was successfully created.")
  #
  #   log_in
  #   expect(current_path).to eq("users/#{user.id}/posts")
  # end

  scenario "will raise an error if login details are incorrect" do
    sign_up
    expect(page).to have_content("User was successfully created.")

    visit "/login"
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "password420"
    click_button "login"
    expect(page).to have_content("Email or password is invalid")
  end

end
