class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user

  protected
  def authenticate_user!
    return true if session[:user_id]
    
    flash[:notice] = 'You need to log in first.'
    redirect_to login_path
    return false
  end

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
