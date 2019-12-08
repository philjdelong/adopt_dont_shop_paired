class Favorites
  attr_reader :favorite_pets

  def initialize(initial_favorite_pets)
    @favorite_pets = initial_favorite_pets || Hash.new(0)
  end

  def total_count
    @favorite_pets.count
  end

  def add_pet(id)
    @favorite_pets[id.to_s] = 1 #count_of(id)
  end

  def remove_pet(id)
    @favorite_pets.delete(id.to_s)
  end

  # def count_of(id)
  #   @favorite_pets[id.to_s].to_i
  # end
end
