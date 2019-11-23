require 'rails_helper'

RSpec.describe "As the user" do
  describe "when i visit shelter id", type: :feature do
    before :each do
      @shelter_1 = Shelter.create(  name:     'The Best Shelter',
                                    address:  '1234 Address St.',
                                    city:     'Denver',
                                    state:    'CO',
                                    zip:      '80202'
      )
      @shelter_2 = Shelter.create(  name:     'The Other Shelter',
                                    address:  '4321 Address St.',
                                    city:     'UnDenver',
                                    state:    'NotCO',
                                    zip:      '20208'
      )
    end

    it "i can see the shelter 1 info" do
      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip)
    end

    it "i can see the shelter 2 info" do
      visit "/shelters/#{@shelter_2.id}"

      expect(page).to have_content(@shelter_2.name)
      expect(page).to have_content(@shelter_2.address)
      expect(page).to have_content(@shelter_2.city)
      expect(page).to have_content(@shelter_2.state)
      expect(page).to have_content(@shelter_2.zip)
    end

    it "i can update shelter 2 info using the edit button" do
      visit "/shelters/#{@shelter_2.id}"

      click_link 'Edit Shelter'
      expect(current_path).to eq("/shelters/#{@shelter_2.id}/edit")

      fill_in "Name", with: "Updated Shelter"
      fill_in "address", with: "Updated Address"
      fill_in "City", with: "Updated City"
      fill_in "State", with: "Updated State"
      fill_in "Zip", with: "Updated Zip"

      click_button 'Update'
      expect(current_path).to eq('/shelters')

      expect(page).to have_content("Updated Shelter")
      expect(page).to_not have_content("The Other Shelter")
    end

    xit "i can delete a shelter using the delete button" do
      visit "/shelters/#{@shelter_1.id}"

      click_button 'Delete'
      expect(current_path).to eq('/shelters')

      expect(page).to_not have_content('The Best Shelter')
    end
  end
end



# User Story 5, Shelter Update

# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
