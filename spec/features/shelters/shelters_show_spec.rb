require 'rails_helper'

RSpec.describe "As the user" do
  describe "when i visit shelter id", type: :feature do
    before :each do
      @shelter_1 = Shelter.create(  name:     'The Shelter',
                                  address:  '1234 Address St.',
                                  city:     'Denver',
                                  state:    'CO',
                                  zip:      '80202'
      )
      @shelter_2 = Shelter.create(  name:   'Shelter 2',
                                  address:  '4321 Address St.',
                                  city:     'Uhhhh',
                                  state:    'OC',
                                  zip:      '09999'
      )

      @review_1 = Review.create(  title: "Love it!",
                                  rating: 5,
                                  content: "I hope they adopt me",
                                  picture: "https://resc-files-prod.s3.us-west-1.amazonaws.com/s3fs-public/styles/large/public/2018-12/welcome-home-preventing-problems_1.jpg?itok=aSaZWhxP",
                                  shelter_id: @shelter_1.id

      )

      @review_2 = Review.create(  title: "It's ok",
                                  rating: 2,
                                  content: "I might recommend to a friend",
                                  shelter_id: @shelter_2.id

      )
      visit "/shelters/#{@shelter_1.id}"
    end

    it "i can see the shelter info" do

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip)
    end

    it "i can update shelter info using the edit button" do

      click_on 'Edit Shelter'
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")

      fill_in "Name", with: "Updated Shelter"
      fill_in "address", with: "Updated Address"
      fill_in "City", with: "Updated City"
      fill_in "State", with: "Updated State"
      fill_in "Zip", with: "Updated Zip"

      click_on 'Update'
      expect(current_path).to eq('/shelters')

      expect(page).to have_content("Updated Shelter")
      expect(page).to_not have_content("The Shelter")
    end

    it "i can delete shelter using the delete button" do

      click_on 'Delete Shelter'
      expect(current_path).to eq('/shelters')

      expect(page).to_not have_content(@shelter_1.name)
    end

    it "i can click a link to visit shelters pets index" do
      click_on "#{@shelter_1.name} Pets"
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
    end

    it "all shelters names are links on the site" do
      visit "/shelters"
      expect(page).to have_link("#{@shelter_1.name}")
      expect(page).to have_link("#{@shelter_2.name}")

      visit "/shelters/#{@shelter_1.id}"
      expect(page).to have_link("#{@shelter_1.name}")

      visit "/shelters/#{@shelter_2.id}"
      expect(page).to have_link("#{@shelter_2.name}")

    end

    it "i can see all reviews for that shelter" do
      expect(page).to have_content("Reviews:")

      expect(page).to have_content(@review_1.title)
      expect(page).to have_content("#{@review_1.rating}/5 Stars!")
      expect(page).to have_content(@review_1.content)
      expect(page).to have_css("img[src*='#{@review_1.picture}']")

      expect(page).to_not have_content(@review_2.title)
      expect(page).to_not have_content("#{@review_2.rating}/5 Stars!")
      expect(page).to_not have_content(@review_2.content)
      expect(page).to_not have_content(@review_2.picture)
    end

    it 'i can click a new review button' do

      click_on 'New Review'
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/new")
    end

    it "i can see all stats for the shelter" do
      expect(page).to have_content(@shelter_1.total_pet_count)
      expect(page).to have_content(@shelter_1.total_app_count)
      expect(page).to have_content(@shelter_1.avg_rating)
    end
  end
end
