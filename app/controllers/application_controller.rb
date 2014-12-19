class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    return true if current_user
    redirect_to sign_in_path
  end

  def current_user
    if session[:user_id].present?
      User.find_by_id(session[:user_id])
    else
      nil
    end
  end

  helper_method :current_user

end
