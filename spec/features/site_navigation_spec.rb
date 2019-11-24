require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit any page on the site" do
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

    it "I see a link to the pet index" do
      visit '/shelters'
#within nav bar??
      click_on 'All Pets'
      expect(current_path).to eq('/pets')

      visit '/pets'
      click_on 'All Pets'
      expect(current_path).to eq('/pets')

      visit "/shelters/#{@shelter_1.id}"
      click_on 'All Pets'
      expect(current_path).to eq('/pets')
      
#this is not an exhaustive list by any means
      paths = ["/shelters", "/pets", "/shelters/#{@shelter_1.id}", "/shelters/#{@shelter_1.id}/pets", "/pets/#{@pet_1.id}", "/shelters/#{@shelter_1.id}/edit", "/pets/#{@pet_1.id}/edit"]

      paths.each do |path|
        visit path
        expect(page).to have_link('All Pets')
      end
    end
  end
end
