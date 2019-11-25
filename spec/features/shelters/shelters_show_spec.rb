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
      visit "/shelters/#{@shelter.id}"
    end

    it "i can see the shelter info" do

      expect(page).to have_content(@shelter.name)
      expect(page).to have_content(@shelter.address)
      expect(page).to have_content(@shelter.city)
      expect(page).to have_content(@shelter.state)
      expect(page).to have_content(@shelter.zip)
    end

    it "i can update shelter info using the edit button" do

      click_on 'Edit Shelter'
      expect(current_path).to eq("/shelters/#{@shelter.id}/edit")

      fill_in "Name", with: "Updated Shelter"
      fill_in "address", with: "Updated Address"
      fill_in "City", with: "Updated City"
      fill_in "State", with: "Updated State"
      fill_in "Zip", with: "Updated Zip"

      click_on 'Update'
      expect(current_path).to eq('/shelters')

      expect(page).to have_content("Updated Shelter")
      expect(page).to_not have_content("The Shelter")
    end

    it "i can delete shelter using the delete button" do

      click_on 'Delete'
      expect(current_path).to eq('/shelters')

      expect(page).to_not have_content('The Shelter')
    end
  end
end
