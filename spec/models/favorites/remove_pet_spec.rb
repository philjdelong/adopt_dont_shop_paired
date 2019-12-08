require 'rails_helper'

RSpec.describe Favorites do
  describe "#remove_pet" do
    it "can add pet to favorite pets" do
      favorites = Favorites.new({
        "1" => 1,
        "2" => 1
        })
      favorites.remove_pet("2")
      expect(favorites.favorite_pets.count).to eq(1)
    end
  end
end
