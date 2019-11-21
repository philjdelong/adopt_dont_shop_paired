require 'rails_helper'

RSpec.describe "As the user" do
  describe "when i click on a shelter" do
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
        visit "/shelters/:id"
      end

      it "i can see the shelter 1 info" type: :feature do
        expect(page).to have_content(@shelter_1.name)
        expect(page).to have_content(@shelter_1.address)
        expect(page).to have_content(@shelter_1.city)
        expect(page).to have_content(@shelter_1.state)
        expect(page).to have_content(@shelter_1.zip)
      end

      it "i can see the shelter 2 info" type: :feature do
        expect(page).to have_content(@shelter_2.name)
        expect(page).to have_content(@shelter_2.address)
        expect(page).to have_content(@shelter_2.city)
        expect(page).to have_content(@shelter_2.state)
        expect(page).to have_content(@shelter_2.zip)
      end
