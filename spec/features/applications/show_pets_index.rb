require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit the favorites page", type: :feature do
    before :each do
      @new_application = Application.create(
        name: 'Travis',
        address: '102 corn st',
        city: 'denver',
        state: 'co',
        zip: '89060',
        phone_number: 5551231414,
        description: 'I make good home'
      )

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

      @fluffy = Pet.create(  image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
                            name:         "Fluffy",
                            age:          12,
                            sex:          "Female",
                            shelter_id:   @courtneys_shelter.id
      )

      @new_application.pets << [@charles, @fluffy]

      visit '/favorites'
    end

    it "i can see a list of all pets that have applications" do
      expect(page).to have_content("You have pending applications for the following pets:")

      expect(page).to have_content(@fluffy.name)
      expect(page).to have_content(@charles.name)

    end

    it "i can click on each applied pets name and be taken to their show page" do
      visit '/favorites'

      click_on "#{@fluffy.name}"
      expect(current_path).to eq("/pets/#{@fluffy.id}")
    end
  end
end
