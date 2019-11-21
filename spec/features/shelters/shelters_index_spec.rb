require 'rails_helper'

RSpec.describe "As the user" do
  describe "when i visit shelter index", type: :feature do
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

      visit "/shelters"

      # click_button "New Shelter"
    end

    it "i can see shelter 1 name" do
      expect(page).to have_content(@shelter_1.name)
    end

    it "i can see shelter 2 name" do
      expect(page).to have_content(@shelter_2.name)
    end

    it "i can click new shelter button" do
      expect(page).to have_link('New Shelter')
    end
  end
end
