# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Shelter.destroy_all (this will destroy all instanced once seed is run)
# Pet.destroy_all (this will destroy all instanced once seed is run)

phils_shelter = Shelter.create( name:     "Phil's Shelter",
                                address:  "1234 Address St.",
                                city:     "Denver",
                                state:    "CO",
                                zip:      "80202"
)
charles = Pet.create( image:      "https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/152964589-welcome-home-new-cat-632x475.jpg",
                      name:       "Charles",
                      age:        "5",
                      sex:        "Male",
                      shelter_id: phils_shelter.id
)
