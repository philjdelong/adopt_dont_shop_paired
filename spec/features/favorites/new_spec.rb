require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit a pets show page", type: :feature do
    before :each do
      @phils_shelter = Shelter.create(name:     "Phil's Shelter",
                                      address:  "1234 Address St.",
                                      city:     "Denver",
                                      state:    "CO",
                                      zip:      "80202"
      )
      @charles = Pet.create(image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
                            name:        "Charles",
                            age:         5,
                            sex:         "Male",
                            shelter_id:  @phils_shelter.id
      )
      @fluffy = Pet.create(image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
                            name:        "Charles",
                            age:         5,
                            sex:         "Male",
                            shelter_id:  @phils_shelter.id
      )
      visit "/pets/#{@charles.id}"
    end

    it "i can click a button to add pet to favorites" do
      expect(page).to have_content("Favorites Count: 0")

      click_on 'Favorite'
      expect(current_path).to eq("/pets/#{@charles.id}")
      expect(page).to have_content("#{@charles.name} has been added to Favorites!")
      expect(page).to have_content("Favorites Count: 1")

      click_on 'Favorite'
      expect(page).to have_content("#{@charles.name} has been added to Favorites!")
      expect(page).to have_content("Favorites Count: 1")

      visit "/pets/#{@fluffy.id}"
      click_on 'Favorite'
      expect(current_path).to eq("/pets/#{@fluffy.id}")
      expect(page).to have_content("#{@fluffy.name} has been added to Favorites!")
      expect(page).to have_content("Favorites Count: 2")
      click_on 'Favorite'
      expect(page).to have_content("#{@fluffy.name} has been added to Favorites!")
      expect(page).to have_content("Favorites Count: 2")
    end
  end
end
