require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'Show error message when visiting favorites index without add any favorites' do

    it 'I see text saying that there are no favorited pets added' do
      visit '/favorites'
      expect(page).to have_content("You have not favorited any pets. Find a pet and click to add them to your favorites to see them here!")
    end
  end
end
