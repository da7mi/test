class ApplicationController < ActionController::Base
  protect_from_forgery  
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  private  
  helper_method :current_user
end
