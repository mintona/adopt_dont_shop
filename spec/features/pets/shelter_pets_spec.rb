require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a shelters pets index page" do
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

      visit "shelters/#{@shelter_1.id}/pets"
    end
    it "I can see each pet that can be adopted from that shelter" do

      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.approximate_age)
      expect(page).to have_content(@pet_1.sex)
      expect(page).to have_css("img[src*='#{@pet_1.image}']")

      expect(page).to_not have_content(@pet_2.name)
      expect(page).to_not have_css("img[src*='#{@pet_2.image}']")

# is this whole next section redundant?

      visit "/shelters/#{@shelter_2.id}/pets"
      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_2.approximate_age)
      expect(page).to have_content(@pet_2.sex)
      expect(page).to have_css("img[src*='#{@pet_2.image}']")

      expect(page).to_not have_content(@pet_1.name)
      expect(page).to_not have_css("img[src*='#{@pet_1.image}']")
    end

    it "I can see a link to edit each pets info" do
      within(:css, "section##{@pet_1.id}") do
        click_on 'Edit Pet'
        expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
      end

      visit "/shelters/#{@shelter_2.id}/pets"

      within(:css, "section##{@pet_2.id}") do
        click_on 'Edit Pet'
        expect(current_path).to eq("/pets/#{@pet_2.id}/edit")
      end
    end
    # it "there is a link to add a new adoptable pet for the shelter" do
    #   visit "shelters/#{shelter_1.id}/pets"
    #
    #   click_link "Add Pet"
    #
    #   expect(current_path).to eq("/shelters/:shelter_id/pets/new")
    #
    # end
  end
end
