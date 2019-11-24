require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the pets index" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Boulder Shelter",
                                address: "123 Arapahoe Ave",
                                city: "Boulder",
                                state: "CO",
                                zip: "80301")

      pet_1_image = "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg"

      @pet_1 = Pet.create!(image: pet_1_image,
                          name: "Alex",
                          approximate_age: "10",
                          sex: "Male",
                          shelter: @shelter_1)

      @shelter_2 = Shelter.create(name: "Denver Shelter",
                                address: "345 Blake St",
                                city: "Denver",
                                state: "CO",
                                zip: "80220")

      pet_2_image = "https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg"
      @pet_2 = Pet.create!(image: pet_2_image,
                          name: "Marley",
                          approximate_age: "2",
                          sex: "Female",
                          shelter: @shelter_2)

        visit '/pets'
    end

    it "I can see each pets info" do
#could add CSS tags here 
      expect(page).to have_content("Name: #{@pet_1.name}")
      expect(page).to have_content("Approximate Age: #{@pet_1.approximate_age}")
      expect(page).to have_content("Sex: #{@pet_1.sex}")
      expect(page).to have_content("Current Shelter: #{@pet_1.shelter.name}")
      expect(page).to have_css("img[src*='#{@pet_1.image}']")
      #how to test for the alt text

      expect(page).to have_content("Name: #{@pet_2.name}")
      expect(page).to have_content("Approximate Age: #{@pet_2.approximate_age}")
      expect(page).to have_content("Sex: #{@pet_2.sex}")
      expect(page).to have_content("Current Shelter: #{@pet_2.shelter.name}")
      expect(page).to have_css("img[src*='#{@pet_2.image}']")

    end

    it "I can see a link to edit each pets info" do
      within(:css, "section##{@pet_1.id}") do
        click_on 'Edit Pet'
        expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
      end

      visit '/pets'

      within(:css, "section##{@pet_2.id}") do
        click_on 'Edit Pet'
        expect(current_path).to eq("/pets/#{@pet_2.id}/edit")
      end
    end

    it "I can click a link to delete each pet" do
      within(:css, "section##{@pet_1.id}") do
        click_on 'Delete Pet'
        expect(current_path).to eq("/pets")
      end

      expect(page).to_not have_content(@pet_1.name)
      # visit '/pets'
      within(:css, "section##{@pet_2.id}") do
        click_on 'Delete Pet'
        expect(current_path).to eq("/pets")
      end

      expect(page).to_not have_content(@pet_2.name)
    end

  end

end
