class OrdersController < ApplicationController
  def index
  	require_user
  	@user = current_user
  	@orders = @user.orders.all
  end

  #def show
 # 	require_user
 # 	@user = current_user
 # 	@order = @user.orders.find_by()
 # end

  def new
  	require_user
  	@user = current_user
  	@order = @user.orders.new
  end

  def create
  	require_user
  	@user = current_user
  	@order = @user.orders.new(order_params)
  	if @order.save
  		flash[:success] = "Thanks for placing your order."
  		redirect_to orders_path
  	else
  		flash[:error] = "Sorry, please try again."
  		render :new
  	end
  end

  private
  def order_params
  	params.require(:user).permit(:stripe_token)
  end

end
