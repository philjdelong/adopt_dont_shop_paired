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
      @courtneys_shelter = Shelter.create(  name:     "Courtney's Shelter",
                                            address:  "4321 Place Ave.",
                                            city:     "Louisville",
                                            state:    "KY",
                                            zip:      "40220"
      )
      @fluffy = Pet.create(   image:        '/pet_fluffy.jpg',
                              name:         "Fluffy",
                              description:  "Fluffy is very aggressive, but you'll love her!",
                              age:          12,
                              sex:          "Female",
                              shelter_id:   @phils_shelter.id,
      )
      @charles = Pet.create(  image:        '/pet_charles.jpg',
                              name:         "Charles",
                              description:  "He likes to go by 'Chuck'",
                              age:          5,
                              sex:          "Male",
                              shelter_id:   @courtneys_shelter.id
      )
    end

    it "i can see the pets info" do
      visit "/pets/#{@fluffy.id}"

      expect(page).to have_css("img[src*='#{@fluffy.image}']")
      expect(page).to have_content("Fluffy")
      expect(page).to have_content("Fluffy is very aggressive, but you'll love her!")
      expect(page).to have_content(12)
      expect(page).to have_content("Female")
      expect(page).to have_content(@fluffy.status)

      expect(page).to_not have_content("Charles")
    end
  end
end
