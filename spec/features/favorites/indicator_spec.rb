require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit any page", type: :feature do
    it "i can see the total count of favorite pets" do
      visit "/"
      expect(page).to have_content("Favorites Count: 0")

      visit "/shelters"
      expect(page).to have_content("Favorites Count: 0")

      visit "/pets"
      expect(page).to have_content("Favorites Count: 0")
    end
  end
end
