require 'rails_helper'

RSpec.describe "As the user" do
  describe "when i visit shelter index", type: :feature do
    before :each do

      @phils_shelter = Shelter.create(  name:     'The Best Shelter',
                                    address:  '1234 Address St.',
                                    city:     'Denver',
                                    state:    'CO',
                                    zip:      '80202'
                                  )
      visit "/shelters"
    end

    it "i can see shelter 1 name" do
      expect(page).to have_content(@phils_shelter.name)
    end

    it "i can click new shelter button" do
      click_on 'New Shelter'
      expect(current_path).to eq('/shelters/new')
    end

    it "i can click a link to edit each shelter" do
      click_on 'Edit Shelter'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/edit")
    end
  end
end
