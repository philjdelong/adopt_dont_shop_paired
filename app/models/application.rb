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

end
