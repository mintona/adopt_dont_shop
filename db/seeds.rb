# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
Shelter.destroy_all

shelter_1 = Shelter.create(name: "Boulder Shelter",
                          address: "123 Arapahoe Ave",
                          city: "Boulder",
                          state: "CO",
                          zip: "80301")

shelter_2 = Shelter.create(name: "Denver Shelter",
                          address: "345 Blake St",
                          city: "Denver",
                          state: "CO",
                          zip: "80220")

pet_1_image = "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg"
pet_1 = Pet.create!(image: pet_1_image,
                    name: "Alex",
                    approximate_age: "10",
                    sex: "male",
                    shelter: shelter_1)

pet_2_image = "https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg"
pet_2 = Pet.create!(image: pet_2_image, name: "Marley", approximate_age: "2", sex: "female", shelter: shelter_2)
