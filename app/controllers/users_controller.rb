class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_permit)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      @user = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_permit
    params.require(:user).permit(:email, :username, :password, :about)
  end

end