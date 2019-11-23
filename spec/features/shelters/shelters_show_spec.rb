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

      fill_in "Name", with: "Old Shelter"
      fill_in "address", with: "1234 New Address St."
      fill_in "City", with: "New City"
      fill_in "State", with: "New State"
      fill_in "Zip", with: "New zip"

      click_button 'Update'
      expect(current_path).to eq('/shelters')

      expect(page).to have_content("Old Shelter")
    end
  end
end
