require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  describe "relationships" do
    it {should have_many :pets}
    it {should have_many :reviews}
  end

  describe "methods" do
    it "shelter can display number of pets average review and number of applications" do
      phils_shelter = Shelter.create( name:     "Phil's Shelter",
                                      address:  "1234 Address St.",
                                      city:     "Denver",
                                      state:    "CO",
                                      zip:      "80202"
      )
      charles = Pet.create( image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
                            name:        "Charles",
                            age:         5,
                            sex:         "Male",
                            shelter_id:  phils_shelter.id
      )
      review_1 = Review.create( title: "Love it!",
                                rating: 4,
                                content: "I hope they adopt me",
                                picture: "https://bloximages.newyork1.vip.townnews.com/postbulletin.com/content/tncms/assets/v3/editorial/b/60/b60a0993-01e8-5b59-82e0-c42b6b95965a/5a1c265fb6932.image.jpg?resize=1200%2C1150",
                                shelter_id: phils_shelter.id
      )

      review_2 = Review.create( title: "It's ok",
                                rating: 2,
                                content: "I might recommend to a friend",
                                shelter_id: phils_shelter.id
      )
      new_application = Application.create(name: 'Travis',
                                        address: '102 corn st',
                                        city: 'denver',
                                        state: 'co',
                                        zip: '89060',
                                        phone_number: 5551231414,
                                        description: 'I make good home'
      )

      charles.applications << new_application

      expect(phils_shelter.total_pet_count).to eq(1)
      expect(phils_shelter.avg_rating).to eq(3)
      expect(phils_shelter.total_app_count).to eq(1)
    end
  end
end
