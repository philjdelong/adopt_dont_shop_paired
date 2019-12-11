require 'rails_helper'


RSpec.describe "As a visitor" do
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
    @buster = Pet.create(
      image:        "https://www.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg",
      name:         "Buster",
      age:          3,
      sex:          "Male",
      shelter_id:   @courtneys_shelter.id
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
    @new_application.pets << [@charles, @fluffy]
  end
  describe "When I visit an applications show page '/applications/:id'" do
    it "I can see all applicant info and names of pets with link" do

      visit "/applications/#{@new_application.id}"
      expect(page).to have_content(@new_application.name)
      expect(page).to have_content(@new_application.address)
      expect(page).to have_content(@new_application.city)
      expect(page).to have_content(@new_application.state)
      expect(page).to have_content(@new_application.zip)
      expect(page).to have_content(@new_application.phone_number)
      expect(page).to have_content(@new_application.description)

      expect(page).to have_link(@charles.name, href: "/pets/#{@charles.id}")
      expect(page).to have_link(@fluffy.name, href: "/pets/#{@fluffy.id}")
      expect(page).not_to have_link(@buster.name)
    end
  end
end
