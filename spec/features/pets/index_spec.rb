require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visits the pets index" do
    it "I can see each pets info" do
      shelter_1 = Shelter.create(name: "Boulder Shelter",
                                address: "123 Arapahoe Ave",
                                city: "Boulder",
                                state: "CO",
                                zip: "80301")

      pet_1_image = "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg"

      pet_1 = Pet.create!(image: pet_1_image, name: "Alex", approximate_age: "10", sex: "Male", shelter: shelter_1)

      shelter_2 = Shelter.create(name: "Denver Shelter",
                                address: "345 Blake St",
                                city: "Denver",
                                state: "CO",
                                zip: "80220")

      pet_2_image = "https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg"
      pet_2 = Pet.create!(image: pet_2_image, name: "Marley", approximate_age: "2", sex: "Female", shelter: shelter_2)

      visit '/pets'

      expect(page).to have_content('Name: Alex')
      expect(page).to have_content('Approximate Age: 10')
      expect(page).to have_content('Sex: Male')
      expect(page).to have_content('Current Shelter: Boulder Shelter')
      expect(page).to have_css("img[src*='#{pet_1_image}']")
      #how to test for the alt text 

      expect(page).to have_content('Name: Marley')
      expect(page).to have_content('Approximate Age: 2')
      expect(page).to have_content('Sex: Female')
      expect(page).to have_content('Current Shelter: Denver Shelter')
      expect(page).to have_css("img[src*='#{pet_2_image}']")

    end
  end

end
