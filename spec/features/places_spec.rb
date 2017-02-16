require 'rails_helper'
describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
    [Place.new( name:"Oljenkorsi", id: 1 )])

    visit places_path
    fill_in('city', with:'kumpula')
    click_button"Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "if many places are returned by the API, all are shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return([Place.new(name:"Oljenkorsi", id:1), Place.new(name:"Gurula", id:2), Place.new(name:"Physicum", id:3)])

    visit places_path
    fill_in('city', with:'kumpula')
    click_button"Search"

    expect(page).to have_content "Oljenkorsi"
    expect(page).to have_content "Physicum"
    expect(page).to have_content "Gurula"
  end


  it "if no places are returned by the API, show proper text" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(Hash[])

    visit places_path
    fill_in('city', with:'kumpula')
    click_button"Search"

    expect(page).to have_content "No locations in kumpula"
  end
end
