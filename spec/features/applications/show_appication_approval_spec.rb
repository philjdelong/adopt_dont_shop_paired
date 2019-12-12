require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit an applications show page", type: :feature do
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

      @fluffy = Pet.create(
        image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
        name:         "Fluffy",
        age:          12,
        sex:          "Female",
        shelter_id:   @courtneys_shelter.id
      )

      @new_application.pets << [@charles, @fluffy]
      visit "/applications/#{@new_application.id}"
    end

    it "i can see all attributes and names of pets applied for" do
      expect(page).to have_content(@new_application.name)
      expect(page).to have_content(@new_application.address)
      expect(page).to have_content(@new_application.city)
      expect(page).to have_content(@new_application.state)
      expect(page).to have_content(@new_application.zip)
      expect(page).to have_content(@new_application.phone_number)
      expect(page).to have_content(@new_application.description)

      expect(page).to have_link(@charles.name)
      click_link(@fluffy.name)
      expect(current_path).to eq("/pets/#{@fluffy.id}")
    end

    it "i can click a link to approve a pet to be adopted" do

      within "#pet-#{@fluffy.id}" do
        click_on "Approve"
        expect(current_path).to eq("/pets/#{@fluffy.id}")
      end

        expect(page).to have_content('Adoption Pending...')
        expect(page).to have_content("#{@new_application.name}")

    end
  end
end
