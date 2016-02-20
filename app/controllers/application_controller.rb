class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :notice, :danger
  helper_method :current_user, :logged_in?, :authenticate_user!
  before_filter :set_categories
  before_filter :set_tags


  def authenticate_user!
    if !logged_in?
      redirect_to login_path, :notice => 'You must be logged in to view that page'
    end
  end


  def set_categories
    @categories ||= Category.all
  end

   def set_tags
    @tags ||= Tag.all.order('updated_at ASC').limit(10)
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
