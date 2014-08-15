class SessionsController < ApplicationController
  def new
  end

  def create

  	@username = params[:session][:username]
  	@password = params[:session][:password]

  	@user = User.find_by(username: @username)

  	if @user.present? and @user.authenticate(@password)
	  	session[:user_id] = @user.id
	  	flash[:success] = "Successfully logged in."
	  	redirect_to root_path
	else

		flash[:error] = "Oops! Try again..."
		render :new
	end

  end

  def destroy
  	reset_session
  	flash[:success] = "You have been logged out successfully."
  	redirect_to root_path
  end
end
