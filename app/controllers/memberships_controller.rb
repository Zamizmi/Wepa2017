class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, except: [:index, :show]


  # GET /memberships
  # GET /memberships.json

  # GET /memberships/1
  # GET /memberships/1.json

  # GET /memberships/new
  def new
    @membership = Membership.new
    @beer_clubs = BeerClub.all
    @users = User.all
    @new_beer_clubs = BeerClub.all
    @new_beer_clubs.delete(current_user.beer_clubs.ids)
  end

  # GET /memberships/1/edit

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)
    @membership.user_id = current_user.id


    respond_to do |format|
      if @membership.save
        format.html { redirect_to beer_club_path(@membership.beer_club_id), notice: "#{current_user.username}, welcome to the club!" }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    membership = Membership.find(params[:id])
    membership.delete if current_user == membership.user
    reset_session
    respond_to do |format|
      format.html { redirect_to beer_clubs_path, notice: 'Your membership was successfully ended.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:beer_club_id, :user_id)
    end
end
