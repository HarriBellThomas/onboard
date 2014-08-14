class UsersController < ApplicationController
  def index 
  	redirect_to root_path
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	@user.save
  	redirect_to root_path
  end

  def edit
  end

  def update
  end

  private
  def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
