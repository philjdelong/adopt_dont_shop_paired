require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit shelters show pets", type: :feature do
    before :each do
      @phils_shelter = Shelter.create(  name:     "Phil's Shelter",
                                        address:  "1234 Address St.",
                                        city:     "Denver",
                                        state:    "CO",
                                        zip:      "80202"
      )
      @fluffy = Pet.create(   image:        "images/pet_fluffy",
                              name:         "Fluffy",
                              age:          12,
                              sex:          "Female",
                              shelter_id:   @phils_shelter.id
      )
      @charles = Pet.create(  image:        "images/pet_charles.jpg",
                              name:         "Charles",
                              age:          5,
                              sex:          "Male",
                              shelter_id:   @phils_shelter.id
      )
      visit "/shelters/#{@phils_shelter.id}/pets"
    end

    it "i see all pets that belong to the shelter" do

      expect(page).to have_image("/image/pet_charles")
      expect(page).to have_content("Charles")
      expect(page).to have_content(5)
      expect(page).to have_content("Male")

      expect(page).to have_image("/image/pet_fluffy")
      expect(page).to have_content("Fluffy")
      expect(page).to have_content(12)
      expect(page).to have_content("Female")
    end
  end
end

# EDIT PETS
# fill_in 'Name' with: @fluffy.name
# fill_in 'Image' with: @fluffy.image
# fill_in 'Age' with: @fluffy.age
# fill_in 'Sex' with: @fluffy.sex
# fill_in 'Shelter' with: @fluffy.shelter_id

# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex
