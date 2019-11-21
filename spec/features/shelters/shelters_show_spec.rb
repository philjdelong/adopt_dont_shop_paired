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
  end
end
