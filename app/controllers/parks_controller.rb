class ParksController < ApplicationController
  before_action :set_parks
  before_action :set_park, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def new
    if current_user.id == 1
      @park = Park.new
    else
      redirect_to root_path
    end
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
    @comment = Comment.new
    @comments = @park.comments.includes(:user)
  end

  def edit
    unless user_signed_in? && current_user.id == 1
      redirect_to root_path
    end
  end

  def update
    if @park.update(park_params)
      redirect_to park_path(@park)
    else
      render :edit
    end
  end

  def destroy
    if @park.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def park_params
    params.require(:park).permit(:name, :address, :image, :latitude, :longitude, :area_id).merge(user_id: current_user.id)
  end

  def set_parks
    @parks = Park.order('created_at DESC')
  end

  def set_park
    @park = Park.find(params[:id])
  end
end
