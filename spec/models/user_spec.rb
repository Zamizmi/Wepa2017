require 'rails_helper'

RSpec.describe User, type: :model do

  describe "favorite style" do
    let(:user){FactoryGirl.create(:user)}

    it "has method for determining the favorite_style" do
      expect(user.favorite_style).to eq(nil)
    end

    it "without ratings user does not have a favorite style" do
      expect(user.favorite_style).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = FactoryGirl.create(:beer)
      rating = FactoryGirl.create(:rating, beer:beer, user:user)
      rating = FactoryGirl.create(:rating2, beer:beer, user:user)

      expect(user.favorite_style).to eq(beer.style)
    end
  end

  describe "favorite beer" do
    let(:user){FactoryGirl.create(:user)}

    it "has method for determining the favorite_beer" do
      expect(user).to respond_to(:favorite_beer)
    end

    it "without ratings user does not have a favorite beer" do
      expect(user.favorite_beer).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = FactoryGirl.create(:beer)
      rating = FactoryGirl.create(:rating, beer:beer, user:user)

      expect(user.favorite_beer).to eq(beer)
    end

    it "is the one with the highest rating if several rated" do
      beer1 = FactoryGirl.create(:beer)
      beer2 = FactoryGirl.create(:beer)
      beer3 = FactoryGirl.create(:beer)
      rating1 = FactoryGirl.create(:rating, beer:beer1, user:user)
      rating2 = FactoryGirl.create(:rating, score:25,  beer:beer2, user:user)
      rating3 = FactoryGirl.create(:rating, score:9, beer:beer3, user:user)

      expect(user.favorite_beer).to eq(beer2)
    end
  end

  it "has the Username set correctly" do
    user = User.new username:"Pekka"

    expect(user.username).to eq"Pekka"
  end

  it "is not saved without a Password" do
    user = User.create username:"Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with too short Password" do
    user = User.create username:"Pekka", password:"sec", password_confirmation:"sec"
    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with Password containing only small letters" do
    user = User.create username:"Pekka", password:"secret", password_confirmation:"secret"
    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with Password containing small and capital letters" do
    user = User.create username:"Pekka", password:"Secret", password_confirmation:"Secret"
    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is saved with a proper Password" do
    user= User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"

    expect(user).to be_valid
    expect(User.count).to eq(1)
  end

  describe "with a proper Password" do
    let(:user) { FactoryGirl.create(:user)}

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end

    it "and with two ratings, has the correct Average_Rating" do
      user.ratings << FactoryGirl.create(:rating)
      user.ratings << FactoryGirl.create(:rating2)

      expect(user.ratings.count).to eq(2)
      expect(user.AverageRating).to eq(20)
    end
  end
end
