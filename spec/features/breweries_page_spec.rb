require 'rails_helper'

describe "Breweries page" do
  it "should not have any before created" do
    visit breweries_path

    expect(page).to have_content 'Breweries'
    expect(page).to have_content 'Number of Active Breweries: 0'
  end

  describe "when breweries exists" do
    before :each do
      @breweries = ["Koff", "Karjala", "Hartwall"]
      year = 1800
      @breweries.each do |brewery_name|
        FactoryGirl.create(:brewery, name: brewery_name, year: year+=1, active: true)
      end
      visit breweries_path
    end

    it "lists the existing breweries and their total number" do
      expect(page).to have_content "Number of Active Breweries: #{@breweries.count}"

      @breweries.each do |brewery_name|
        expect(page).to have_content brewery_name
      end
    end

    it "allows User to navigate to page of a Brewery" do
      click_link "Koff"

      expect(page).to have_content "Koff"
      expect(page).to have_content "Established in: 1801"
    end
  end
end
