class Application < ApplicationRecord

has_many :pets_applications
has_many :pets, through: :pets_applications

validates_presence_of :name,
                      :address,
                      :city,
                      :state,
                      :zip,
                      :phone_number,
                      :description

  def update_adoption_status(pets)
    pets.each do |pet|
      if pet.adoption_status == "adoptable"
        status = "pending"
      else
        status = "adoptable"
      end
      pet.update({adoption_status: status})
      pet.save
    end
  end

  def remove_all_favorite_pets(id)

  end

end
