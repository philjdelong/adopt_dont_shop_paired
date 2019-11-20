require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see all shops" do
    shop_1 = Shop.create( name: "Shelter 1")
    shop_2 = Shop.create( name: "Shelter 2")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
  end
end
