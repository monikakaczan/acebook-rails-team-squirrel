def sign_up
  visit "/"
  fill_in "user_email", with: "email@email.com"
  fill_in "user_password", with: "password1"
  fill_in "user_password_confirmation", with: "password1"
  click_button "Create User"
end

def short_password
  visit "/"
  fill_in "user_email", with: "email@email.com"
  fill_in "user_password", with: "passw"
  fill_in "user_password_confirmation", with: "passw"
  click_button "Create User"
end

def password_match
  visit "/"
  fill_in "user_email", with: "email@email.com"
  fill_in "user_password", with: "password"
  fill_in "user_password_confirmation", with: "notpassword"
  click_button "Create User"
end

def log_in
  visit "/login"
  fill_in "email", with: "email@email.com"
  fill_in "password", with: "password1"
  click_button "login"
end

def create_user_and_log_in
  visit '/'
  fill_in :user_email, with: "joe@joe.com"
  fill_in :user_password, with: "123456"
  fill_in :user_password_confirmation, with: "123456"
  click_button "Create User"
  visit "/login"
  fill_in :email, with: "joe@joe.com"
  fill_in :password, with: "123456"
  click_button "login"
end 
