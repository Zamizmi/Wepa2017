class SessionsController < ApplicationController

  def new
    # renders login page
  end

  def create
    #search by username
    user = User.find_by username: params[:username]
    # save the user_id to session
    session[:user_id] = user.id if not user.nil?
    # redirect to users own page
    redirect_to user
  end

  def destroy
    # destroy session
    session[:user_id] = nil
    # redirect to main page
    redirect_to :root
  end
end
