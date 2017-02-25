class RatingsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, except: [:index, :show, :create, :new]


  def index
    @ratings = Rating.all
    @recent = Rating.recent
    @breweries = Brewery.all.top(3)
    @beers = Beer.all.top 3
    @users = User.all.top 3
    @styles = Style.all.top(3)
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
