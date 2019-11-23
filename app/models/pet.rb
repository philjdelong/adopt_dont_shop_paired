class Pets < ApplicationRecord
  validates_presence_of :image,
                        :name,
                        :age,
                        :sex,
                        :shelter_id
end
