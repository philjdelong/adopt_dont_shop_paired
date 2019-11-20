require 'rails_helper'

describe "shelter index page", type: :feature do
  before :each do
    @shelter_1 = Shop.create( name: "Shelter 1")
    @shelter_2 = Shop.create( name: "Shelter 2")

    visit "/shelters"
  end

  it "can see all shops" do
    expect(page).to have_content(@shelter_1.name)
  end
end
