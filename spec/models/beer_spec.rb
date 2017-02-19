require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "is saved if Name and Style are proper" do
    style = FactoryGirl.create(:style)
    beer = Beer.create name:"Karhu 3", style_id:style.id

    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  it "is not saved without a Style" do
    beer = Beer.create name:"Karhu 3", style_id:nil

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "is not saved without a Name" do
    style = FactoryGirl.create(:style)
    beer = Beer.new name:nil, style_id:style.id

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end
