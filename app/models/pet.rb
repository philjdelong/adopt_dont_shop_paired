class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pets_applications
  has_many :applications, through: :pets_applications

  validates_presence_of :image,
                        :name,
                        :age,
                        :description,
                        :sex
end
