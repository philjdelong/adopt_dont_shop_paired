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

courtneys_shelter = Shelter.create( name:     "Courtney's Shelter",
                                    address:  "4321 Place Ave.",
                                    city:     "Louisville",
                                    state:    "KY",
                                    zip:      "40220"
)

charles = Pet.create( image:       "https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg",
                      name:        "Charles",
                      age:         5,
                      sex:         "Male",
                      shelter_id:  phils_shelter.id
)

fluffy = Pet.create(  image:        "https://www.sideshow.com/storage/product-images/903202/t-rex__feature.jpg",
                      name:         "Fluffy",
                      age:          12,
                      sex:          "Female",
                      shelter_id:   courtneys_shelter.id
)

review_1 = Review.create( title: "Love it!",
                          rating: 5,
                          content: "I hope they adopt me",
                          picture: "https://bloximages.newyork1.vip.townnews.com/postbulletin.com/content/tncms/assets/v3/editorial/b/60/b60a0993-01e8-5b59-82e0-c42b6b95965a/5a1c265fb6932.image.jpg?resize=1200%2C1150",
                          shelter_id: phils_shelter.id
)

review_2 = Review.create( title: "It's ok",
                          rating: 2,
                          content: "I might recommend to a friend",
                          shelter_id: courtneys_shelter.id
)
