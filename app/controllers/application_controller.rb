class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :user_logged_in?

  def user_logged_in?
    if !session[:uid].nil? && !User.find(session[:uid]).nil?
      return true
    else
      redirect_to login_path
    end


  end

end
