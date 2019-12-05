require 'rails_helper'

RSpec.describe "As a user" do
  describe "When I visit a shelter's show page, I see a link to add a new review for this shelter", type: :feature do
    before :each do

      @phils_shelter = Shelter.create(
                                    name:     'The Best Shelter',
                                    address:  '1234 Address St.',
                                    city:     'Denver',
                                    state:    'CO',
                                    zip:      '80202'
      )
      @review_1 = Review.create(title: "Love it!",
                                rating: 5,
                                content: "I hope they adopt me",
                                picture: "https://bloximages.newyork1.vip.townnews.com/postbulletin.com/content/tncms/assets/v3/editorial/b/60/b60a0993-01e8-5b59-82e0-c42b6b95965a/5a1c265fb6932.image.jpg?resize=1200%2C1150",
                                shelter_id: @phils_shelter.id
      )

      visit "/shelters/#{@phils_shelter.id}"
    end

    it "I can click a link to be taken to a new review path, create new review without picture, and display flash message if required fields are missing input" do

      click_on "New Review"
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/reviews/new")

      fill_in 'Title', with: "#{@review_1.title}"
      fill_in 'Rating', with: @review_1.rating
      fill_in 'Content', with: "#{@review_1.content}"
      expect(page).to have_content("Picture")

      click_on 'Create'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}")

      expect(page).to have_content(@review_1.title)
      expect(page).to have_content(@review_1.rating)
      expect(page).to have_content(@review_1.content)
      expect(page).to have_content(@review_1.picture)

      click_on 'New Review'

      fill_in 'Title', with: "Shelter Review new new"
      fill_in 'Rating', with: 4
      fill_in 'Content', with: "ipsum dolar whatever"

      click_on 'Create'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}")

      review = Review.last

      expect(page).to have_content(review.title)
      expect(page).to have_content(review.content)
      expect(page).to have_content(review.rating)


      click_on 'New Review'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/reviews/new")

      click_on 'Create'

      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/reviews/new")
      expect(page).to have_content("Review not created - Please complete required fields")
      end
    end
  end
