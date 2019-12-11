require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
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
    @buster = Pet.create(
      image:        "https://www.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg",
      name:         "Buster",
      age:          3,
      sex:          "Male",
      shelter_id:   @courtneys_shelter.id
    )
    @fluffy = Pet.create(  image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
                          name:         "Fluffy",
                          age:          12,
                          sex:          "Female",
                          shelter_id:   @courtneys_shelter.id
    )
    @charles = Pet.create(
      image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
      name:        "Charles",
      age:         5,
      sex:         "Male",
      shelter_id:  @phils_shelter.id
    )
    @new_application = Application.create(
      name: 'Travis',
      address: '102 corn st',
      city: 'denver',
      state: 'co',
      zip: '89060',
      phone_number: 5551231414,
      description: 'I make good home'
    )
    @new_application2 = Application.create(
      name: 'Phil furreal',
      address: '3343 Denver st',
      city: 'denver',
      state: 'co',
      zip: '80602',
      phone_number: 1246753323,
      description: 'Furry fun home for pet'
    )
    @new_application.pets << [@charles]
    @new_application2.pets << [@fluffy]

  end

  describe 'When I visit a pets show page' do
    it 'I see a link to view all applications for this pet' do
      visit "/pets/#{@charles.id}"

      expect(page).to have_link("View applications for this pet")
    end

    it 'I see a list of names of applicants for pet linking to application show page when clicking link' do
      visit "/pets/#{@charles.id}"
      click_on("View applications for this pet")

      expect(current_path).to eq("/pets/#{@charles.id}/applications")
      expect(page).to have_link("#{@new_application.name}", href: "/applications/#{@new_application.id}")
      expect(page).not_to have_link("#{@new_application2.name}")

      visit "/pets/#{@fluffy.id}/applications"
      expect(page).to have_link("#{@new_application2.name}", href: "/applications/#{@new_application2.id}")
      expect(page).not_to have_link("#{@new_application.name}")
    end

    it "I see a message that there are no applications for this pet" do
      visit "/pets/#{@buster.id}"
      click_on("View applications for this pet")

      expect(page).to have_content("No applications for this pet")
    end
  end
end
