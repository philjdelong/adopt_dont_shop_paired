require 'rails_helper'

RSpec.describe Favorites do
  describe "#add_pet" do
    it "can add pet to favorite pets" do
      favorites = Favorites.new({
        "1" => 1,
        "2" => 1
        })
      favorites.add_pet("3")
      expect(favorites.favorite_pets.count).to eq(3)
    end
  end
end
