require 'rails_helper'

RSpec.describe Application, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
    it {should validate_presence_of :phone_number}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {have_many :pet}
    it {have_many :application}
  end

  describe 'methods' do
    it 'adds pet to application' do
      phils_shelter = Shelter.create( name:     "Phil's Shelter",
                                      address:  "1234 Address St.",
                                      city:     "Denver",
                                      state:    "CO",
                                      zip:      "80202"
      )
      new_application = Application.create(name: 'Travis',
                                        address: '102 corn st',
                                        city: 'denver',
                                        state: 'co',
                                        zip: '89060',
                                        phone_number: 5551231414,
                                        description: 'I make good home'
      )
      charles = Pet.create( image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
                            name:        "Charles",
                            age:         5,
                            sex:         "Male",
                            shelter_id:  phils_shelter.id
      )
      fluffy = Pet.create(  image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
                            name:         "Fluffy",
                            age:          12,
                            sex:          "Female",
                            shelter_id:   phils_shelter.id
      )
      pets = [charles, fluffy]

      new_application.update_adoption_status(pets)

      expect(charles.adoption_status).to eq("pending")
      expect(fluffy.adoption_status).to eq("pending")
    end
  end
end
