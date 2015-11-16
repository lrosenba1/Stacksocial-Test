class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #def current_user
   # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  
  def current_login
    @current_login ||= Newuser.find(session[:newuser_id]) if session[:newuser_id]
  end
  helper_method :current_login
  
  def authorize
    redirect_to '/login' unless current_login
  end

end
