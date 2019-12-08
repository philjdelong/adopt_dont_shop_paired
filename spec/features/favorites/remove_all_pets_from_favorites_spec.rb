require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @phils_shelter = Shelter.create( name:     "Phil's Shelter",
                                    address:  "1234 Address St.",
                                    city:     "Denver",
                                    state:    "CO",
                                    zip:      "80202"
    )
   @charles = Pet.create( image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
                         name:        "Charles",
                         age:         5,
                         sex:         "Male",
                         shelter_id:  @phils_shelter.id
   )
   @fluffy = Pet.create(  image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
                         name:         "Fluffy",
                         age:          12,
                         sex:          "Female",
                         shelter_id:   @phils_shelter.id
   )

    visit "/pets/#{@charles.id}"
    click_on('Favorite')
    visit "/pets/#{@fluffy.id}"
    click_on('Favorite')

    visit '/favorites'
  end

  describe "When I favorite pets and visit favorites index page" do

    it "I see a link to remove all favorited pets" do
        expect(page).to have_link('Remove All Favorited Pets')
    end

    it "Redirected back to favorites page and there are no favorites, favorite indicator is 0" do
        click_on('Remove All Favorited Pets')

        expect(current_path).to eq('/favorites')
        expect(page).to have_content("Your favorited pets have been removed")
        expect(page).to have_content("You have not favorited any pets. Find a pet and click to add them to your favorites to see them here!")
        expect(page).to have_content('Favorites Count (0)')
    end
  end
end
