require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit pets index", type: :feature do
    before :each do
      @phils_shelter = Shelter.create(  name:     "Phil's Shelter",
                                        address:  "1234 Address St.",
                                        city:     "Denver",
                                        state:    "CO",
                                        zip:      "80202"
      )
      @charles = Pet.create(  image:        '/pet_charles.jpg',
                              name:         "Charles",
                              age:          5,
                              sex:          "Male",
                              shelter_id:   @phils_shelter.id
      )
      visit "/pets"
    end

    it "i can see all adoptable pets" do

      expect(page).to have_css("img[src*='#{@charles.image}']")
      expect(page).to have_content(@charles.name)
      expect(page).to have_content(@charles.age)
      expect(page).to have_content(@charles.sex)
    end
  end
end
