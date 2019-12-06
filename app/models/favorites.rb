class Favorites
  attr_reader :favorites
  def initialize(favorite_pets)
    @favorites = favorite_pets || Hash.new(0)
  end

  def total_count
    @favorites.values.sum
  end
end
