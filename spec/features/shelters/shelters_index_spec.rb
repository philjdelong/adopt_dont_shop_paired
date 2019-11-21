require 'rails_helper'

describe "shelter index page", type: :feature do
    before :each do
    @shelter_1 = Shelter.create(name: 'Shelter 1')
    @shelter_2 = Shelter.create(name: 'Shelter 2')
    visit "/shelters"
  end

  it "can see shelter 1" do
    expect(page).to have_content(@shelter_1.name)
  end

  it "can see shelter 2" do
    expect(page).to have_content(@shelter_2.name)
  end
end
