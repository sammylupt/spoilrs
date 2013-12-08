class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def check_for_current_user
    redirect_to root_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(:token => session[:token] )
  end
end
