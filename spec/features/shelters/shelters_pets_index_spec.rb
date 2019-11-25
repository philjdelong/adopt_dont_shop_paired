require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit a shelters show pets", type: :feature do
    before :each do
      @phils_shelter = Shelter.create(  name:     "Phil's Shelter",
                                        address:  "1234 Address St.",
                                        city:     "Denver",
                                        state:    "CO",
                                        zip:      "80202"
      )
      @courtneys_shelter = Shelter.create(  name:     "Courtney's Shelter",
                                            address:  "4321 Place Ave.",
                                            city:     "Louisville",
                                            state:    "KY",
                                            zip:      "40220"
      )
      @fluffy = Pet.create(   image:        '/pet_fluffy.jpg',
                              name:         "Fluffy",
                              age:          12,
                              sex:          "Female",
                              shelter_id:   @phils_shelter.id
      )
      @charles = Pet.create(  image:        '/pet_charles.jpg',
                              name:         "Charles",
                              age:          5,
                              sex:          "Male",
                              shelter_id:   @courtneys_shelter.id
      )
      visit "/shelters/#{@phils_shelter.id}/pets"
    end

    it "i see all pets that belong to that shelter" do
      expect(page).to have_css("img[src*='#{@fluffy.image}']")
      expect(page).to have_content("Fluffy")
      expect(page).to have_content(12)
      expect(page).to have_content("Female")
    end

    it "i dont see pets from other shelters" do
      expect(page).to_not have_css("img[src*='#{@charles.image}']")
      expect(page).to_not have_content("Charles")
      expect(page).to_not have_content(5)
      expect(page).to_not have_content("Male")
    end

    it "i can edit each pet from the shelters pets list" do
      click_on "Edit #{@fluffy.name}"
      expect(current_path).to eq("/pets/#{@fluffy.id}/edit")
    end

    it "i can click and delete each pet" do
      click_on 'Delete Charles'
      expect(current_path).to eq("/pets")

      expect(page).to_not have_content(@charles.name)
    end
  end
end
