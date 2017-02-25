class SessionsController < ApplicationController

  def new
    # renders login page
  end

  def create
    user = User.find_by username: params[:username]
    if user.blocked
      redirect_to :back, notice: "Your account is frozen, contact Administration immediatly!"
      return
    end
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    else
      redirect_to :back, notice: "Username and/or password mismatch"
    end
  end

  def destroy
    # destroy session
    session[:user_id] = nil
    # redirect to main page
    redirect_to :root
  end
end
