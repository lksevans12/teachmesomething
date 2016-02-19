class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :notice, :danger
  helper_method :current_user, :logged_in?, :authenticate_user!

  private

  def authenticate_user!
    if !logged_in?
      redirect_to login_path, :notice => 'You must be logged in to view that page'
    end
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
