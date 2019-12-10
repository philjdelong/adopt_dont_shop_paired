require 'rails_helper'
RSpec.describe "As a visitor" do
  describe "when i vist the favorites index page", type: :feature do
    before :each do
      @shelter_1 = Shelter.create(name:     'The Shelter',
                                  address:  '1234 Address St.',
                                  city:     'Denver',
                                  state:    'CO',
                                  zip:      '80202'
      )
      @shelter_2 = Shelter.create(name:   'Shelter 2',
                                  address:  '4321 Address St.',
                                  city:     'Uhhhh',
                                  state:    'OC',
                                  zip:      '09999'
      )
      @charles = Pet.create( image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
                            name:        "Charles",
                            age:         5,
                            sex:         "Male",
                            shelter_id:  @shelter_1.id
      )
      @fluffy = Pet.create(  image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
                            name:         "Fluffy",
                            age:          12,
                            sex:          "Female",
                            shelter_id:   @shelter_2.id
      )
      @buster = Pet.create(  image:        "https://www.bornfreepetfood.com/wp-content/uploads/2018/04/animal-collar-dog-8700.jpg",
                            name:         "Buster",
                            age:          2,
                            sex:          "Male",
                            shelter_id:   @shelter_2.id
      )
      visit "/pets/#{@charles.id}"
      click_on 'Favorite'
      visit "/pets/#{@fluffy.id}"
      click_on 'Favorite'
    end

    it "i can click link to start a new applicaiton" do
      visit "/favorites"

      click_link('New Application')
      expect(current_path).to eq('/favorites/applications/new')

      find("#checkbox-#{@charles.id}").set(true)
      expect(page).to_not have_css("#checkbox-#{@buster.id}")

      fill_in "Name", with: "Big Philly"
      fill_in "Address", with: "17th st"
      fill_in "City", with: "Pottersville"
      fill_in "State", with: "Colorado"
      fill_in "Zip", with: "80602"
      fill_in "Phone Number", with: "5556789191"
      fill_in "Why would you be a good home for the pet(s) you want to adopt?", with: "ipsum dolar hello?"

      click_button 'Submit'
      expect(current_path).to eq("/favorites")

      expect(page).to have_content("Your application has been sent!")
      expect(page).to have_content(@fluffy.name)
      expect(page).to_not have_content(@charles.name)
    end
  end
end
