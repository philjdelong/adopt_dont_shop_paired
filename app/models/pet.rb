class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pets_applications, dependent: :destroy
  has_many :applications, through: :pets_applications

  validates_presence_of :image,
                        :name,
                        :age,
                        :description,
                        :sex

  def update_adoption_status
    pet[:adoption_status] = "Adoption Pending..."
    pet.save
  end
end
