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
      @fluffy = Pet.create(   image:        'fluffy_image',
                              name:         "Fluffy",
                              age:          12,
                              sex:          "Female",
                              shelter_id:   @phils_shelter.id
      )
      visit("/pets/#{@fluffy.id}")
    end

    it "i can edit pet information" do
      click_link 'Edit Pet'
      expect(current_path).to eq("/pets/#{@fluffy.id}/edit")

      fill_in 'Image', with: 'fluffy_image_2'
      fill_in 'Name', with: ''
      fill_in 'Descrition', with: 'Still fluffy'
      fill_in 'Age', with: '13'
      fill_in 'Sex', with: ''

      click_on 'Make Changes'
      expect(current_path).to eq("/pets/#{@fluffy.id}")

      expect(page).to have_css("image[src*='fluffy_image_2']")
      expect(page).to have_content('Name: Fluffy')
      expect(page).to have_content('Description: Still Fluffy')
      expect(page).to have_content('Age: 13')
      expect(page).to have_content('Sex: Female')

      expect(page).to_not have_content('12')
    end
  end
end

# User Story 11, Pet Update
#
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
