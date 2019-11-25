require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit a pets show page", type: :feature do
    before :each do
      @phils_shelter = Shelter.create(  name:     "Phil's Shelter",
                                        address:  "1234 Address St.",
                                        city:     "Denver",
                                        state:    "CO",
                                        zip:      "80202"
      )
      @fluffy = Pet.create(   image:        'fluffy_image.jpg',
                              name:         "Fluffy",
                              description:  "REALLY FLUFFY",
                              age:          12,
                              sex:          "female",
                              shelter_id:   @phils_shelter.id,
                              status:       "Adoptable!"
      )
      visit("/pets/#{@fluffy.id}")
    end

    it "i can click the delete button to delete the pet" do
      click_on 'Delete Pet'
      expect(current_path).to eq('/pets')

      expect(page).to_not have_content('Fluffy')
    end
  end
end
