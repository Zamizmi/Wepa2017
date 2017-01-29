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
    #respond_to do |format|
      #format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      #format.json { head :no_content }
      rating.delete
      redirect_to ratings_url
    #end
  end

  def create
    rating = Rating.create params.require(:rating).permit(:score, :beer_id)
    #save the created rating to the session
    session[:last_rating] = "#{rating.beer.name} #{rating.score} points"

    redirect_to ratings_path
  end

  # GET /ratings/1/edit
  def edit
  end
end
