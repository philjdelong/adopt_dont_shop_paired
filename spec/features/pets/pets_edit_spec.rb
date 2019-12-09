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
      )
      visit("/pets/#{@fluffy.id}")
    end

    it "i can edit pet information" do
      click_on 'Edit Pet'
      expect(current_path).to eq("/pets/#{@fluffy.id}/edit")

      fill_in 'Image', with: 'jimmy_image.jpg'
      fill_in 'Name', with: 'Jimmy'
      fill_in 'Description', with: 'Still fluffy'
      fill_in 'Age', with: '13'
      fill_in 'Sex', with: 'male'

      click_on 'Make Changes'
      expect(current_path).to eq("/pets/#{@fluffy.id}")

      expect(page).to have_content('Jimmy')
      expect(page).to have_css("img[src*='jimmy_image.jpg']")
      expect(page).to have_content('Still fluffy')
      expect(page).to have_content('13')
      expect(page).to have_content('male')

      expect(page).to_not have_css("img[src*='fluffy_image.jpg']")
      expect(page).to_not have_content('REALLY FLUFFY')
      expect(page).to_not have_content('12')
      expect(page).to_not have_content('female')
    end
  end
end
