class UsersController < ApplicationController
  def index 
  	redirect_to root_path
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = "Thanks for signing up!"
  	  redirect_to root_path
    else
      flash.now[:error] = "Oops, try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Oops! An error occured."
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:username, :email, :fullname, :password, :password_confirmation)
  end

end
