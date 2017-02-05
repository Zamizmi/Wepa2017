require 'rails_helper'

RSpec.describe User, type: :model do
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
    let(:user) { User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"}

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end

    it "and with two ratings, has the correct Average_Rating" do
      user = User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"
      rating = Rating.new score:10
      rating2 = Rating.new score:30

      user.ratings << rating
      user.ratings << rating2
      expect(user.ratings.count).to eq(2)
      expect(user.AverageRating).to eq(20)
    end
  end
end
