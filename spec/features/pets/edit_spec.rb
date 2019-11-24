require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a pet show page" do
    before(:each) do
        @shelter_1 = Shelter.create(name: "Boulder Shelter",
                                    address: "123 Arapahoe Ave",
                                    city: "Boulder",
                                    state: "CO",
                                    zip: "80301")

        @original_image = "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg"
        @original_description = "I am a loveable, snuggly, cat! If you are anti-snuggle, look elsewhere. I want to be pet at all times!"
        @original_name = "Alex"
        @original_age = "10"
        @original_sex = "Male"
        @pet_1 = @shelter_1.pets.create!(name: @original_name,
                                        image: @original_image,
                                        approximate_age: @original_age,
                                        sex: @original_sex,
                                        description: @original_description)
    end

    it "has a link to update that pet" do
      visit "/pets/#{@pet_1.id}"

      click_link 'Update Pet'

      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
    end

    describe "I click the update pet link to" do
      describe "fill out the form to update" do
        it "some the pets information" do

          visit "/pets/#{@pet_1.id}/edit"

          #test that the form has the original information from above
          # expect(page).to find_field('Name').value.to eq(@original_name)
          expect(find_field('Name').value).to eq(@original_name)
          expect(find_field('Image').value).to eq(@original_image)
          expect(find_field('Approximate age').value).to eq(@original_age)
          expect(find_field('Sex').value).to eq(@original_sex)
          # fill_in 'Image', with: image
          fill_in 'Name', with: "Amber"
          # fill_in 'Description', with: description
          fill_in 'Approximate age', with: "9"
          select 'Female', from: :sex

          click_on 'Update Pet'

          expect(current_path).to eq("/pets/#{@pet_1.id}")

          expect(page).to have_content("Amber")
          expect(page).to_not have_content(@original_name)

          expect(page).to have_content('9')
          expect(page).to_not have_content(@original_age)

          expect(page).to have_content(@original_description)
          expect(page).to have_css("img[src*='#{@original_image}']")

        end

        xit "all of the pets information" do
          #is this really necessary?
          # test that the form has the original information from above
        end
      end
    end
  end
end
