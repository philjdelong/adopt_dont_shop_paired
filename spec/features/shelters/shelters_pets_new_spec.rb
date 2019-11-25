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
      click_link 'New Pet'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/pets/new")

      fill_in 'Image', with: "https://i1.wp.com/dehayf5mhw1h7.cloudfront.net/wp-content/uploads/sites/291/2019/06/21124954/Praying-mantis.jpg?ssl=1"
      fill_in 'Name', with: "Zeke"
      fill_in 'Description', with: "He may look paranoid, and he is!"
      fill_in 'Age', with: 2
      fill_in 'Sex', with: "male"

      click_on 'Add Pet'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/pets")

      expect(page).to have_css("img[src*='https://i1.wp.com/dehayf5mhw1h7.cloudfront.net/wp-content/uploads/sites/291/2019/06/21124954/Praying-mantis.jpg?ssl=1']")
      expect(page).to have_content("Zeke")
      expect(page).to have_content("He may look paranoid, and he is!")
      expect(page).to have_content(2)
      expect(page).to have_content("male")
      expect(page).to have_content("Adoptable")
    end
  end
end
