require 'rails_helper'

RSpec.describe "As a user" do
  describe "When I visit a shelter show page, I can click a link next to each shelter to delete the review", type: :feature do
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
                                shelter_id: @phils_shelter.id)

      @review_2 = Review.create(title: "Where is the beef",
                                rating: 2,
                                content: "I want a human",
                                picture: "https://scx2.b-cdn.net/gfx/news/hires/2018/2-dog.jpg",
                                shelter_id: @phils_shelter.id)

      visit "/shelters/#{@phils_shelter.id}"

    end

    it 'can click a link next to a specific shelter review, delete review and take back to shelter show page where review is gone' do
      within("#review-#{@review_1.id}") do
        click_on "Delete Review", exact: true
        expect(current_path).to eq("/shelters/#{@phils_shelter.id}")
      end


      expect(page).to have_content(@review_2.title)
      expect(page).to have_content(@review_2.rating)
      expect(page).to have_content(@review_2.content)
      expect(page).to have_css("img[src*='#{@review_2.picture}']")

      expect(page).to have_no_content(@review_1.title)
      expect(page).to have_no_content(@review_1.content)
      expect(page).to have_no_content(@review_1.picture)
    end
  end
end
