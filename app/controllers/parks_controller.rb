class ParksController < ApplicationController
  before_action :set_parks
  before_action :set_park, only: [:show, :edit, :update]
  
  def index
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @park.update(park_params)
      redirect_to park_path(@park)
    else
      render :edit
    end
  end

  private
  def park_params
    params.require(:park).permit(:name, :address, :image, :latitude, :longitude)
  end

  def set_parks
    @parks = Park.order('created_at DESC')
  end

  def set_park
    @park = Park.find(params[:id])
  end
end