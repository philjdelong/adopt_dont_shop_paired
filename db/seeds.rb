# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Shelter.destroy_all (this will destroy all instanced once seed is run)
# Pet.destroy_all (this will destroy all instanced once seed is run)

shelter_1 = Shelter.create(  name:     'The Best Shelter',
                              address:  '1234 Address St.',
                              city:     'Denver',
                              state:    'CO',
                              zip:      '80202'
)
shelter_2 = Shelter.create(  name:     'The Other Shelter',
                              address:  '4321 Address St.',
                              city:     'UnDenver',
                              state:    'NotCO',
                              zip:      '20208'
)
