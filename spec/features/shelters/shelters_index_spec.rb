require 'rails_helper'

describe "shelter index page", type: :feature do
    before :each do
    @shelter_1 = Shelter.create(  name:     'The Best Shelter',
                                  address:  '1234 Address St.',
                                  city:     'Denver',
                                  state:    'CO',
                                  zip:      '80202'
    )
    @shelter_2 = Shelter.create(  name:     'The Other Shelter',
                                  address:  '4321 Address St.',
                                  city:     'UnDenver',
                                  state:    'NotCO',
                                  zip:      '20208'
    )

    visit "/shelters"
  end

  it "can see shelter 1 name" do
    expect(page).to have_content(@shelter_1.name)
    # expect(page).to have_content(@shelter_1.address)
    # expect(page).to have_content(@shelter_1.city)
    # expect(page).to have_content(@shelter_1.state)
    # expect(page).to have_content(@shelter_1.zip)
  end

  it "can see shelter 2 name" do
    expect(page).to have_content(@shelter_2.name)
  end
end
