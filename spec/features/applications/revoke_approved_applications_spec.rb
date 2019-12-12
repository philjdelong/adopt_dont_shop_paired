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

      within "#pet-#{@fluffy.id}" do
        click_on "Approve"
        expect(current_path).to eq("/pets/#{@fluffy.id}")
      end
      expect(page).to have_content('Adoption Pending...')

      visit "/applications/#{@new_application.id}"
    end

    it 'When visiting application show page, can no longer see approved button, instead see revoke button' do

      within "#pet-#{@fluffy.id}" do
        expect(page).not_to have_link('Approve')
      end

      within "#pet-#{@fluffy.id}" do
        expect(page).to have_link('Revoke')
      end

    end

    it 'When revoke button is clicked, I am taken back to application show page where approved button is shown again, and pets show page shows pet as adoptable' do

      within "#pet-#{@fluffy.id}" do
        click_on "Revoke"
        expect(current_path).to eq("/applications/#{@new_application.id}")
      end
      
      within "#pet-#{@fluffy.id}" do
        expect(page).to have_link('Approve')
      end

      visit "/pets/#{@fluffy.id}"
      expect(page).not_to have_content('Adoption Pending...')
      expect(page).to have_content("Adoptable")
    end
  end
end
