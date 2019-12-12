require 'rails_helper'

describe "As a visitor" do
  before :each do
    @courtneys_shelter = Shelter.create(
      name:     "Courtney's Shelter",
      address:  "4321 Place Ave.",
      city:     "Louisville",
      state:    "KY",
      zip:      "40220"
    )
    @fluffy = Pet.create( image:       "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
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
  end
  describe "When a pet is added to favorites" do
    it "Deleting pet removes it from the favorites" do
      visit("/pets/#{@buster.id}")
      click_on('Favorite')
      visit("/pets/#{@fluffy.id}")
      click_on('Favorite')

      visit '/favorites'

      expect(page).to have_link("#{@buster.name}", href: "/pets/#{@buster.id}")

      expect(page).to have_link("#{@fluffy.name}", href: "/pets/#{@fluffy.id}")

      visit("/pets/#{@buster.id}")
      click_on('Delete Pet')

      visit '/favorites'

      expect(page).not_to have_link("#{@buster.name}", href: "/pets/#{@buster.id}")
      expect(page).to have_link("#{@fluffy.name}", href: "/pets/#{@fluffy.id}")

    end
  end
end
