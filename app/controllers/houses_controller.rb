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
  	@house.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
