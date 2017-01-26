class RatingsController < ApplicationController
  before_action :set_brewery, only: [:show, :edit, :update, :destroy]

  def index
    @ratings = Rating.all
  #  render :ratings
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /ratings/1/edit
  def edit
  end
end
