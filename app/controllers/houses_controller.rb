class HousesController < ApplicationController
  def index
  	@houses = House.all
  end

  def show
  	@house = House.find(params[:id])
    if @house.user.id == current_user.id
      @is_author = true
    else
      @is_author = false
    end
  end

  def new
    require_user
    @user = current_user
  	@house = @user.houses.new
  end

  def create
    require_user
    @user = current_user
  	@house = @user.houses.new(house_params)
  	if @house.save!
      flash[:success] = "House added successfully."
  	  redirect_to house_path(@house)
    else
      flash[:error] = "House couldn't be added. Please try again."
      render :new
    end
  end

  def edit
    require_user
    @user = current_user
    @house_temp = House.find(params[:id])
    if @user.id == @house_temp.user.id
      @house = @user.houses.find(params[:id])
    else
      flash[:error] = "You aren't allowed to edit someone else's house!"
      redirect_to house_path(params[:id])
    end
  end

  def update
    require_user
    @user = current_user
    @house = @user.houses.find(params[:id])
    if @house.update(house_params)
      flash[:success] = "House updated successfully."
      redirect_to house_path(@house)
    else
      flash.now[:error] = "Oh dear. The house couldn't be updated. Please try again."
      render :edit
    end    
  end

  def destroy
    require_user
    @user = current_user
    @house_temp = House.find(params[:id])
    if @user.id == @house_temp.user.id
      @house = @user.houses.find( params[:id] )
      if @house.present?
        if @house.destroy
          flash[:success] = "Successfully deleted '#{@house.title}'"
        else
          flash[:error] = "House couldn't be deleted."
        end
      else
        flash[:error] = "No house found with ID #{params[:id]} "
      end
      redirect_to root_path
    else
      flash[:error] = "You aren't allowed to delete someone else's house!"
      redirect_to house_path(params[:id])
    end
  end

  private
  def house_params
  	params.require(:house).permit(:title, :description, :address, :price_in_pence, :number_of_rooms, :max_guests, :image, :user_id)
  end

end
