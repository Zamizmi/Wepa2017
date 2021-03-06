require 'rails_helper'

describe "Beerlist page" do

  before :all do
    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(allow_localhost:true)
  end

  before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start

    @brewery1 = FactoryGirl.create(:brewery, name:"Koff")
    @brewery2 = FactoryGirl.create(:brewery, name:"Schlenkerla")
    @brewery3 = FactoryGirl.create(:brewery, name:"Ayinger")
    @style1 = Style.create name:"Lager", description:"jes"
    @style2 = Style.create name:"Rauchbier", description:"jes"
    @style3 = Style.create name:"Weizen", description:"jes"
    @beer1 = FactoryGirl.create(:beer, name:"Nikolai", brewery_id: @brewery1.id, style_id:@style1.id)
    @beer2 = FactoryGirl.create(:beer, name:"Fastenbier", brewery_id:@brewery2.id, style_id:@style2.id)
    @beer3 = FactoryGirl.create(:beer, name:"Lechte Weisse", brewery_id:@brewery3.id, style_id:@style3.id)
  end

  after :each do
    DatabaseCleaner.clean
  end

  after :all do
    self.use_transactional_fixtures = true
  end

  it "shows one known beer", :js =>true do
    visit beerlist_path
    save_and_open_page
    expect(page).to have_content "Nikolai"
  end

  it "shows a known beer", :js => true do
    visit beerlist_path
    find('table').find('tr:nth-child(2)')

    expect(page).to have_content "Nikolai"
  end

    it "shows beers in right order", :js => true do
      visit beerlist_path
      save_and_open_page
      expect(find('table').find('tr:nth-child(2)')).to have_content"Fastenbier"

      expect(find('table').find('tr:nth-child(3)')).to have_content"Lechte Weisse"

      expect(find('table').find('tr:nth-child(4)')).to have_content"Nikolai"
    end

    it "makes order correct when clicking style", :js=> true do
      visit beerlist_path
      click_link("style")
      expect(find('table').find('tr:nth-child(2)')).to have_content"Nikolai"

      expect(find('table').find('tr:nth-child(3)')).to have_content"Fastenbier"

      expect(find('table').find('tr:nth-child(4)')).to have_content"Lechte Weisse"
    end

    it "makes order correct when clicking brewery", :js=> true do
      visit beerlist_path
      click_link("brewery")
      expect(find('table').find('tr:nth-child(2)')).to have_content"Lechte Weisse"

      expect(find('table').find('tr:nth-child(3)')).to have_content"Nikolai"

      expect(find('table').find('tr:nth-child(4)')).to have_content"Fastenbier"
    end

end
