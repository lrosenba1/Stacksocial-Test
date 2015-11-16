class LoginsessionsController < ApplicationController
  def new
  end
 
  def create
    user = Newuser.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:newuser_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:newuser_id] = nil
    redirect_to'/login'
  end
end
