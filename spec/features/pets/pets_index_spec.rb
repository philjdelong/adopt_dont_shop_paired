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
      @charles = Pet.create(  image:      'images/pet_charles',
                              name:       "Charles",
                              age:        "5",
                              sex:        "Male",
                              shelter_id: @phils_shelter.id
      )
      visit "/pets"
    end

    it "i can see all adoptable pets" do

      expect(page).to have_content(@charles.image)
      expect(page).to have_content(@charles.name)
      expect(page).to have_content(@charles.age)
      expect(page).to have_content(@charles.sex)
      expect(page).to have_content(@charles.shelter_id)
    end
  end
end


# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
