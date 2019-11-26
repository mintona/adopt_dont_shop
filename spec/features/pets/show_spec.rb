require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the pets show page" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Boulder Shelter",
                                address: "123 Arapahoe Ave",
                                city: "Boulder",
                                state: "CO",
                                zip: "80301")

      pet_1_image = "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg"
      pet_1_description = "I am a loveable, snuggly, cat! If you are anti-snuggle, look elsewhere. I want to be pet at all times!"
      @pet_1 = Pet.create!(image: pet_1_image,
                          name: "Alex",
                          approximate_age: "10",
                          sex: "Male",
                          shelter: @shelter_1,
                          description: pet_1_description)

      @shelter_2 = Shelter.create(name: "Denver Shelter",
                                address: "345 Blake St",
                                city: "Denver",
                                state: "CO",
                                zip: "80220")

      pet_2_image = "https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg"
      pet_2_description = 'I am the cutest puppy ever! I love to be around kids as long as they do not play too "ruff."'
      @pet_2 = Pet.create!(image: pet_2_image,
                          name: "Marley",
                          approximate_age: "6",
                          sex: "Female",
                          shelter: @shelter_2,
                          description: pet_2_description)

    end
    it "shows the pets info with the matching id" do
      # shelter_1 = Shelter.create(name: "Boulder Shelter",
      #                           address: "123 Arapahoe Ave",
      #                           city: "Boulder",
      #                           state: "CO",
      #                           zip: "80301")
      #
      # pet_1_image = "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg"
      # pet_1_description = "I am a loveable, snuggly, cat! If you are anti-snuggle, look elsewhere. I want to be pet at all times!"
      # pet_1 = Pet.create!(image: pet_1_image,
      #                     name: "Alex",
      #                     approximate_age: "10",
      #                     sex: "Male",
      #                     shelter: shelter_1,
      #                     description: pet_1_description)
      #
      # shelter_2 = Shelter.create(name: "Denver Shelter",
      #                           address: "345 Blake St",
      #                           city: "Denver",
      #                           state: "CO",
      #                           zip: "80220")
      #
      # pet_2_image = "https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg"
      # pet_2_description = 'I am the cutest puppy ever! I love to be around kids as long as they do not play too "ruff."'
      # pet_2 = Pet.create!(image: pet_2_image,
      #                     name: "Marley",
      #                     approximate_age: "6",
      #                     sex: "Female",
      #                     shelter: shelter_2,
      #                     description: pet_2_description)

      visit "/pets/#{@pet_1.id}"

      expect(page).to have_content("#{@pet_1.name}")
      expect(page).to have_content("#{@pet_1.description}")
      expect(page).to have_content("#{@pet_1.approximate_age}")
      expect(page).to have_content("#{@pet_1.sex}")
      #is there a way to make this more dynamic? this what i'm looking for in this case specifically
      expect(page).to have_content("Adoption Status: Adoptable")
      expect(page).to have_css("img[src*='#{@pet_1.image}']")

      expect(page).to_not have_content(@pet_2.name)

      @pet_1.update(adoptable: false)

      visit "/pets/#{@pet_1.id}"

      expect(page).to have_content("Adoption Status: Adoption Pending")
    end

    describe "I can click a link to change the pets adoptable status" do

      it "if pet is adoptable" do
        visit "/pets/#{@pet_1.id}"

        expect(page).to have_content("Adoptable")

        click_on "Change to Adoption Pending"

        expect(current_path).to eq("/pets/#{@pet_1.id}")

        expect(page).to have_content("Adoption Status: Adoption Pending")
        expect(page).to_not have_content("Adoption Status: Adoptable")

      end

      it "if pet is not adoptable" do
        @pet_1.update(adoptable: false)

        visit "/pets/#{@pet_1.id}"

        expect(page).to have_content("Adoption Pending")

        click_on "Change to Adoptable"

        expect(current_path).to eq("/pets/#{@pet_1.id}")

        expect(page).to have_content("Adoption Status: Adoptable")
        expect(page).to_not have_content("Adoption Status: Adoption Pending")

      end
    end
  end
end
