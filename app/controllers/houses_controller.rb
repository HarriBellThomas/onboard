class HousesController < ApplicationController
  def index
  	@houses = House.all
  end

  def show
  	@house = House.find(params[:id])
  end

  def new
  	@house = House.new
  end

  def create
  	@house = House.new(house_params)
  	if @house.save
      flash[:success] = "House added successfully."
  	  redirect_to house_path(@house)
    else
      flash[:error] = "House couldn't be added. Please try again."
      render :new
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    if @house.update(house_params)
      flash[:success] = "House updated successfully."
      redirect_to house_path(@house)
    else
      flash.now[:error] = "Oh dear. The house couldn't be updated. Please try again."
      render :edit
    end    
  end

  def destroy
    @house = House.find( params[:id] )
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
  end

  private
  def house_params
  	params.require(:house).permit(:title, :description, :address, :price_in_pence, :number_of_rooms, :max_guests, :image)
  end

end
