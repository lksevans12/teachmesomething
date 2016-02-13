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
    @categories = Category.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_permit)
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages
      render :'edit'
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    @user.skip_reconfirmation!
    user.destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_permit
    params.require(:user).permit(:email, :username, :password, :about, :website, :facebook)
  end

end