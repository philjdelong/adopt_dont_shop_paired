require 'rails_helper'

describe "As a visitor" do
  before :each do
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
    @new_application.pets << [@buster, @charles]
    visit("/applications/#{@new_application.id}")
    within "#pet-#{@buster.id}" do
      click_on "Approve"
    end
  end
  describe "When shelter has an approved pet application" do
    it "Shelter can not be deleted from shelter show page" do
      visit "/shelters/#{@courtneys_shelter.id}"

      expect(page).to have_content(@courtneys_shelter.name)
      expect(page).not_to have_button('Delete Shelter')


      visit "/shelters/#{@phils_shelter.id}"
      expect(page).to have_content(@phils_shelter.name)
      expect(page).to have_button('Delete Shelter')

    end

    # it "Shelter can not be deleted from shelter index page" do
    #   visit "/shelters"
    #   expect(page).not_to have_button('Delete Shelter')
    #   expect(page).to have_button('Delete Shelter')
    #
    # end
  end
end
