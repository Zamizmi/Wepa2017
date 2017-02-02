class RatingsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  def index
    @ratings = Rating.all
  #  render :ratings
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to :back
  end

  def create
    rating = Rating.create params.require(:rating).permit(:score, :beer_id)
    current_user.ratings << rating
    redirect_to current_user
  end

  # GET /ratings/1/edit
  def edit
  end
end
