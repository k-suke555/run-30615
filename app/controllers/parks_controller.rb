class ParksController < ApplicationController
  before_action :set_parks
  
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
    @park = Park.find(params[:id])
  end

  private
  def park_params
    params.require(:park).permit(:name, :address, :image, :latitude, :longitude)
  end

  def set_parks
    @parks = Park.order('created_at DESC')
  end
end
