require 'rails_helper'
include Helpers

describe "Rating" do
  let!(:brewery) {FactoryGirl.create :brewery, name:"Koff"}
  let!(:beer1) {FactoryGirl.create :beer, name:"iso 3", brewery:brewery}
  let!(:beer2) {FactoryGirl.create :beer, name:"Karhu", brewery:brewery}
  let!(:user) {FactoryGirl.create :user}

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "when given, is registered to the beer and user who is signed in" do
    visit new_rating_path
    select('iso 3', from:'rating[beer_id]')
    fill_in('rating[score]', with:'15')

    expect{click_button('Create Rating')}.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.AverageRating).to eq(15.0)
  end

  it "shows ratings and the amount of ratings" do
    FactoryGirl.create :rating, beer_id:2, user_id:1
    FactoryGirl.create :rating2, beer_id:1, user_id:1
    visit ratings_path

    expect(page).to have_content("Number of Ratings: 2")
    expect(Rating.count).to eq(2)
  end

  it "made by a user are only listed on the users page" do
    FactoryGirl.create :rating, beer_id:1, user_id:1
    FactoryGirl.create :rating, score:8, beer_id:2, user_id:1
    FactoryGirl.create :user, username:"Matti", password:"Matti1", password_confirmation:"Matti1"
    FactoryGirl.create :rating2, beer_id:1, user_id:2
    visit user_path(User.first)

    expect(page).to have_content("Has made 2 ratings , with the average of 9.0")
    expect(Rating.count).to eq(3)
  end

  it "deleted by user are also deleted from the Database" do
    matti = User.create! username:"Matti", password:"Matti1", password_confirmation:"Matti1"
    kalle = User.create! username:"Kalle", password:"Kalle1", password_confirmation:"Kalle1"
    sign_in(username:"Matti", password:"Matti1")
    FactoryGirl.create :rating, beer_id:1, user_id:matti.id
    FactoryGirl.create :rating, score:8, beer_id:2, user_id:matti.id
    FactoryGirl.create :rating2, beer_id:3, user_id:kalle.id
    visit user_path(matti.id)
    page.find('tr', :text => "Karhu: Koff").click_link('Delete')
    #save_and_open_page

    expect(page).to have_content("Has made 1 rating , with the average of 10.0")
    expect(Rating.count).to eq(2)
  end
end
