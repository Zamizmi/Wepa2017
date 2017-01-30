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
    rating.delete
    redirect_to :back
  end

  def create
    @rating = Rating.create params.require(:rating).permit(:score, :beer_id)

    if @rating.save
      current_user.ratings << @rating
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
    #save the created rating to the session
  end

  # GET /ratings/1/edit
  def edit
  end
end
