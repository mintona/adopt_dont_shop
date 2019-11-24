require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a pet show page" do
    before(:each) do
        @shelter_1 = Shelter.create(name: "Boulder Shelter",
                                    address: "123 Arapahoe Ave",
                                    city: "Boulder",
                                    state: "CO",
                                    zip: "80301")

        @image = "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg"
        @description = "I am a loveable, snuggly, cat! If you are anti-snuggle, look elsewhere. I want to be pet at all times!"
        @name = "Alex"
        @age = "10"
        @sex = "Male"
        @pet_1 = @shelter_1.pets.create!(name: @name,
                                        image: @image,
                                        approximate_age: @age,
                                        sex: @sex,
                                        description: @description)
    end

    it "I see a link to delete the pet" do
      visit "/pets/#{@pet_1.id}"

      expect(page).to have_link 'Delete Pet'
      # expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
    end

    it "I click the delete pet link to remove pet from the pets index" do
      visit '/pets'

      expect(page).to have_content(@pet_1.name)

      visit "/pets/#{@pet_1.id}"

      click_link 'Delete Pet'

      expect(current_path).to eq('/pets')
    end
  end
end
