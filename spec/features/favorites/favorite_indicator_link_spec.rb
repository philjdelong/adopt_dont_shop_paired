require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  it 'I see a favorite indicator in my navigation bar on all pages with count of favorited pets' do
    visit '/'

    within('#nav') do
      expect(page).to have_content('Favorites Count (0)')
    end

    visit '/pets'

    within('#nav') do
      expect(page).to have_content('Favorites Count (0)')
    end

    visit '/shelters'

    within('#nav') do
      expect(page).to have_content('Favorites Count (0)')
    end

    visit '/shelters/new'

    within('#nav') do
      expect(page).to have_content('Favorites Count (0)')
    end
  end

  it 'Clicking on the favorites indicator takes me to the favorites index page' do
    visit '/'

    click_on('Favorites Count (0)')

    expect(current_path).to eq('/favorites')
  end
end
