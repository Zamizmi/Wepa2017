require 'rails_helper'
include Helpers

describe "Beers page" do
  it "should not have any beers before created" do
    visit beers_path
    expect(page).to have_content 'Beers'
    expect(page).to have_content 'Number of Beers: 0'
  end

  it "creating a beer with a not valid name gives an error" do
    FactoryGirl.create(:brewery, name: "Koff", year: 1999)
    visit signin_path
    User.create username:"Pekka", password:"Foobar1", password_confirmation:"Foobar1"
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    save_and_open_page

    fill_in('beer_name', with:'')
    select("Koff", from:'beer[brewery_id]')
    click_button("Create Beer")

    expect(page).to have_content "2 errors prohibited rating from being saved:"
    expect(Beer.count).to eq(0)
  end
end
