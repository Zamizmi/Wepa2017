class PlacesController < ApplicationController
  before_action :ensure_that_signed_in, except: [:index, :show]

  def index
  end

  def show
    places_in_cache = Rails.cache.read(session[:last_city])
    @place_to_show = places_in_cache.find{ |x| x.id == params[:id] }
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      session[:last_city] = "#{params[:city]}"
      render :index
    end
  end
end
