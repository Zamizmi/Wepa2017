require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe "when initialized with name Schlenkerla and year 1674" do
    subject{ Brewery.create name: "Schlenkerla", year: 1674, active:true }

    it { should be_valid }
    its(:name) { should eq("Schlenkerla") }
    its(:year) { should eq(1674) }
    its(:active) {should eq(true)}
  end

  it "without a name is not valid" do
    brewery = Brewery.create year:1674, active: true

    expect(brewery).not_to be_valid
  end
end
