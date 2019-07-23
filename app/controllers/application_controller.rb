class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if User.all == []
      @current_user = nil
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  helper_method :current_user
  
end
