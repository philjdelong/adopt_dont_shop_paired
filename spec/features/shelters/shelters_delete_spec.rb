require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit a shelter show or index page", type: :feature do
    before :each do
      @phils_shelter = Shelter.create(
        name:     "Phil's Shelter",
        address:  "1234 Address St.",
        city:     "Denver",
        state:    "CO",
        zip:      "80202"
      )

      @charles = Pet.create(
        image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
        name:        "Charles",
        age:         5,
        sex:         "Male",
        shelter_id:  @phils_shelter.id
      )

      @review = Review.create(
        title:      "Love it!",
        rating:     5,
        content:    "I hope they adopt me",
        picture:    "https://bloximages.newyork1.vip.townnews.com/postbulletin.com/content/tncms/assets/v3/editorial/b/60/b60a0993-01e8-5b59-82e0-c42b6b95965a/5a1c265fb6932.image.jpg?resize=1200%2C1150",
        shelter_id: @phils_shelter.id
      )

      @application = Application.create(
        name: 'Travis',
        address: '102 corn st',
        city: 'denver',
        state: 'co',
        zip: '89060',
        phone_number: 5551231414,
        description: 'I make good home'
      )

    end

    it "i can delete each shelter by clicking a link" do
      visit "/shelters/#{@phils_shelter.id}"

      click_on "Delete Shelter"
      
      expect(current_path).to eq("/shelters")

      expect(page).to_not have_content("#{@phils_shelter.name}")
    end

    it "all reviews are deleted when the shelter is deleted" do
      visit "/shelters/#{@phils_shelter.id}"

      click_on "Delete Shelter"
      expect(Review.all.count).to eq(0)
    end

    it "all pets are deleted when the shelter is deleted" do
      visit "/shelters/#{@phils_shelter.id}"

      click_on "Delete Shelter"
      expect(Pet.all.count).to eq(0)
    end

    it "i cannot delete a shelter with an approved pet" do

      @application.pets << [@charles]

      visit "/applications/#{@application.id}"
      click_on "Approve"

      visit "/shelters/#{@phils_shelter.id}"

      expect(page).to_not have_button("Delete Shelter")

    end
  end
end



# DELETE FROM "pets" WHERE "pets"."id" IN (SELECT "pets"."id" FROM "pets" WHERE "pets"."shelter_id" = $1)
