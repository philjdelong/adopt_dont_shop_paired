require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit shelters new" do
    describe "and fill out the new shelter form", type: :feature do

      it "i see a form for new shelter" do
        visit '/shelters'

        click_on "New Shelter"
        expect(current_path).to eq('/shelters/new')

        fill_in 'Name', with: "Phil's Spot"
        fill_in 'Address', with: "1234 Address"
        fill_in 'City', with: "City"
        fill_in 'State', with: "State"
        fill_in 'Zip', with: "Zip"

        click_button 'Create'
        expect(current_path).to eq('/shelters')

        expect(page).to have_content("Phil's Spot")
      end
    end
  end
end
