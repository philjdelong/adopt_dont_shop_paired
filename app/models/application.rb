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
      if pet.adoption_status == true
        status = "Adoptable"
      else
        status = "Adoption Pending"
      end
      pet.update({adoption_status: status})
      pet.save
    end
  end
end
