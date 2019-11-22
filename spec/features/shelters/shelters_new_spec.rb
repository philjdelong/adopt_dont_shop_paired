require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit shelters new" do
    describe "and fill out the new shelter form", type: :feature do

      it "i see a form for new shelter" do
        visit '/shelters'

        click_link "New Shelter"
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

# User Story 4, Shelter Creation
#
# Then I see a link to create a new Shelter
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
