require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit the favorites index page", type: :feature do
    before :each do
      @phils_shelter = Shelter.create(
        name:     "Phil's Shelter",
        address:  "1234 Address St.",
        city:     "Denver",
        state:    "CO",
        zip:      "80202"
      )

      @courtneys_shelter = Shelter.create(
        name:     "Courtney's Shelter",
        address:  "4321 Place Ave.",
        city:     "Louisville",
        state:    "KY",
        zip:      "40220"
      )

      @charles = Pet.create(
        image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
        name:        "Charles",
        age:         5,
        sex:         "Male",
        shelter_id:  @phils_shelter.id
      )

      @fluffy = Pet.create(
        image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
        name:         "Fluffy",
        age:          12,
        sex:          "Female",
        shelter_id:   @courtneys_shelter.id
      )

      @wilbur = Pet.create(
        image:        "No Image",
        name:         "Wilbur",
        age:          15,
        sex:          "Male",
        shelter_id:   @courtneys_shelter.id
      )

      visit "/pets/#{@charles.id}"
      click_on 'Favorite'

      visit "/favorites"
    end

    it "i can click a button to remove pets from favorites" do

      click_button 'Remove Favorite'
      expect(current_path).to eq("/favorites")

      expect(page).to_not have_link("Charles")
      expect(page).to have_content("Favorites Count (0)")
    end
  end
end
