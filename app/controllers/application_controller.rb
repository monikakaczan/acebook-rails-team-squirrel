class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_signup

private

  def require_signup
    puts 'there'
    return false if current_user

puts 'here'
    redirect_to signup_url
  end

  def current_user
   if User.all == []
     @current_user = nil
   else
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end
 end

end
