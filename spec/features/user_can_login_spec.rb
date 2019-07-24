require 'rails_helper'
require './spec/features/user_spec_helper'

RSpec.feature "New session", type: :feature do
  scenario "New session" do
    user = User.create(email: "joe@joe.com", password: "123456", password_confirmation: "123456")

    visit "/login"
    fill_in :email, with: "joe@joe.com"
    fill_in :password, with: "123456"
    click_button "login"

    expect(page.current_path).to eq "/users/#{user.id}/posts"
  end
end
