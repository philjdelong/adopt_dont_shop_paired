require 'rails_helper'

RSpec.describe "As a user" do
  describe "When I visit a shelter's show page, I see a link to edit the shelter review next to each review", type: :feature do
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

    it 'i can click link to go to edit shelter review, i can see prepopulated data, can update any field, and submit the form' do

      click_on 'Edit Review'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}/reviews/#{@review_1.id}/edit")

      expect(find_field('title').value).to eq "Love it!"
      expect(find_field('rating').value).to eq "5"
      expect(find_field('content').value).to eq "I hope they adopt me"
      expect(page).to have_content("Picture")

      fill_in 'title', with: 'Hate it!'
      fill_in 'rating', with: 1
      fill_in 'content', with: 'Put me down'
      fill_in 'picture', with: 'https://embarkvet.com/wp-content/uploads/2019/07/research-dog.png'

      click_on 'Save Review'
      expect(current_path).to eq("/shelters/#{@phils_shelter.id}")
      expect(page).to have_content('Hate it!')
      expect(page).to have_content(1)
      expect(page).to have_content('Put me down')

      visit "/shelters/#{@phils_shelter.id}/reviews/#{@review_1.id}/edit"

      fill_in 'title', with: ""
      fill_in 'content', with: ""
      fill_in 'rating', with: 2
      click_on 'Save Review'

      expect(page).to have_content("Title, rating, and content must be filled out")
      expect(page).to have_button("Save Review")
    end
  end
end
