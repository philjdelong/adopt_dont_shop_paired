require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit the shelters pets show page", type: :feature do
    before :each do

      @phils_shelter = Shelter.create(  name:     "Phil's Shelter",
                                        address:  "1234 Address St.",
                                        city:     "Denver",
                                        state:    "CO",
                                        zip:      "80202"
      )
      visit("/shelters/#{@phils_shelter.id}/pets")
    end

    it "i can add a new shelter pet" do
      click_button 'New Pet'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/pets/new")

      fill_in 'Image', with: "https://images2.minutemediacdn.com/image/upload/c_crop,h_1193,w_2121,x_0,y_64/f_auto,q_auto,w_1100/v1565279671/shape/mentalfloss/578211-gettyimages-542930526.jpg"
      fill_in 'Name', with: "Zeke"
      fill_in 'Description', with: "He may look paranoid, and he is!"
      fill_in 'Age', with: 2.125
      fill_in 'Sex (male -or- female)', with: "male"

      click_button 'Add Pet'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/pets")

      expect(page).to have_image("https://images2.minutemediacdn.com/image/upload/c_crop,h_1193,w_2121,x_0,y_64/f_auto,q_auto,w_1100/v1565279671/shape/mentalfloss/578211-gettyimages-542930526.jpg")
      expect(page).to have_content("Zeke")
      expect(page).to have_content("He may look paranoid, and he is!")
      expect(page).to have_content(2.125)
      expect(page).to have_content("male")
      expect(page).to have_content("Adoptable!")
    end
  end
end

# User Story 10, Shelter Pet Creation
#
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
