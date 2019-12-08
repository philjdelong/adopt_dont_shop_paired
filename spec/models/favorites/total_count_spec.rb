require 'rails_helper'

RSpec.describe Favorites do
  describe "#total_count" do
    it "can calculate number of favorite pets" do
      favorites = Favorites.new({
        pet_1: 1,
        pet_2: 1,
        pet_3: 1
        })
      expect(favorites.total_count).to eq(3)
    end
  end
end
