require 'rails_helper'

RSpec.describe "As the user" do
  describe "when i visit shelter id", type: :feature do
    before :each do
      @shelter = Shelter.create(  name:     'The Shelter',
                                    address:  '1234 Address St.',
                                    city:     'Denver',
                                    state:    'CO',
                                    zip:      '80202'
      )
      # @shelter_2 = Shelter.create(  name:     'The Other Shelter',
      #                               address:  '4321 Address St.',
      #                               city:     'UnDenver',
      #                               state:    'NotCO',
      #                               zip:      '20208'
      # )
    end

    it "i can see the shelter info" do
      visit "/shelters/#{@shelter.id}"

      expect(page).to have_content(@shelter.name)
      expect(page).to have_content(@shelter.address)
      expect(page).to have_content(@shelter.city)
      expect(page).to have_content(@shelter.state)
      expect(page).to have_content(@shelter.zip)
    end

    # it "i can see the shelter 2 info" do
    #   visit "/shelters/#{@shelter_2.id}"
    #
    #   expect(page).to have_content(@shelter_2.name)
    #   expect(page).to have_content(@shelter_2.address)
    #   expect(page).to have_content(@shelter_2.city)
    #   expect(page).to have_content(@shelter_2.state)
    #   expect(page).to have_content(@shelter_2.zip)
    # end

    it "i can update shelter info using the edit button" do
      visit "/shelters/#{@shelter.id}"

      click_link 'Edit Shelter'
      expect(current_path).to eq("/shelters/#{@shelter.id}/edit")

      fill_in "Name", with: "Updated Shelter"
      fill_in "address", with: "Updated Address"
      fill_in "City", with: "Updated City"
      fill_in "State", with: "Updated State"
      fill_in "Zip", with: "Updated Zip"

      click_button 'Update'
      expect(current_path).to eq('/shelters')

      expect(page).to have_content("Updated Shelter")
      expect(page).to_not have_content("The Shelter")
    end

    it "i can delete shelter using the delete button" do
      visit "/shelters/#{@shelter.id}"

      click_button 'Delete'
      expect(current_path).to eq('/shelters')

      expect(page).to_not have_content('The Shelter')
    end
  end
end

# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
