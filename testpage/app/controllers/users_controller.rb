class UsersController < ApplicationController
  def new
  end

  def create
    user = Newuser.new(user_params)
    if user.save
      session[:newuser_id] = user.id
      redirect_to '/'
    else
      redirect to 'signup'
    end
  end

  private
   def user_params
     params.require(:user).permit(:username, :password, :password_confirmation)
   end

end
