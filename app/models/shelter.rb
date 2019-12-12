class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip

  def total_pet_count
    pets.count
  end

  def avg_rating
    if reviews.count == 0
      return 0
    else
      (total_rating / reviews.count).to_i
    end
  end

  def total_rating
    x = 0
    reviews.each do |review|
      x += review.rating
    end
    x
  end

  def total_app_count
    x = 0
    pets.each do |pet|
      x += pet.applications.count
    end
    x
  end

end
