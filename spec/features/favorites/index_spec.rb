require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit the favorites index page", type: :feature do
    before :each do
      @phils_shelter = Shelter.create( name:     "Phil's Shelter",
                                      address:  "1234 Address St.",
                                      city:     "Denver",
                                      state:    "CO",
                                      zip:      "80202"
      )

      @courtneys_shelter = Shelter.create( name:     "Courtney's Shelter",
                                          address:  "4321 Place Ave.",
                                          city:     "Louisville",
                                          state:    "KY",
                                          zip:      "40220"
      )

      @charles = Pet.create( image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
                            name:        "Charles",
                            age:         5,
                            sex:         "Male",
                            shelter_id:  @phils_shelter.id
      )

      @fluffy = Pet.create(  image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
                            name:         "Fluffy",
                            age:          12,
                            sex:          "Female",
                            shelter_id:   @courtneys_shelter.id
      )

      @wilbur = Pet.create( image:        "No Image",
                            name:         "Wilbur",
                            age:          15,
                            sex:          "Male",
                            shelter_id:   @courtneys_shelter.id
      )

      visit "/pets/#{@charles.id}"
      click_on 'Favorite'
      visit "/pets/#{@fluffy.id}"
      click_on 'Favorite'

      visit "/favorites"
    end

    it "i can see all favorited pets with name and image" do

      expect(page).to have_content(@charles.name)
      expect(page).to have_css("img[src*='#{@charles.image}']")

      expect(page).to have_content(@fluffy.name)
      expect(page).to have_css("img[src*='#{@fluffy.image}']")

      expect(page).to_not have_content(@wilbur.name)
      expect(page).to_not have_css("img[src*='#{@wilbur.image}']")

      click_link "#{@charles.name}"
      expect(current_path).to eq("/pets/#{@charles.id}")
    end
  end
end

# User Story 10, Favorite Index Page
#
# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites index page ("/favorites")
# I see all pets I've favorited
# Each pet in my favorites shows the following information:
# - pet's name (link to pets show page)
# - pet's image
# ```
