require 'rails_helper'

describe "shelter index page", type: :feature do
  it "can see all shops" do
    shelter_1 = Shelter.create(name: "Shelter 1")
    shelter_2 = Shelter.create(name: "Shelter 2")

    visit "/shelters"

    expect(page).to have_content(shelter_1)
    expect(page).to have_content(shelter_2)
  end
end
