class Pet < ApplicationRecord
  validates_presence_of :image,
                        :name,
                        :age,
                        :sex
end
