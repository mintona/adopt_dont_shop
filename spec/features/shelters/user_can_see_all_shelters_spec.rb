require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the shelters index page" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Boulder Shelter",
                                address: "123 Arapahoe Ave",
                                city: "Boulder",
                                state: "CO",
                                zip: "80301")
      @shelter_2 = Shelter.create(name: "Denver Shelter",
                                address: "345 Blake St",
                                city: "Denver",
                                state: "CO",
                                zip: "80220")

      visit "/shelters"
    end

    it "I can see all shelters names" do

      expect(page).to have_content(@shelter_1.name)
      # expect(page).to have_content("#{shelter_1.name}")

      expect(page).to have_content(@shelter_2.name)
      # expect(page).to have_content("#{shelter_2.name}")
    end

    it "I can click a link to edit each shelter" do

      within(:css, "section##{@shelter_1.id}") do
        click_on 'Edit Shelter'
        expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
      end

      visit '/shelters'

      within(:css, "section##{@shelter_2.id}") do
        click_on 'Edit Shelter'
        expect(current_path).to eq("/shelters/#{@shelter_2.id}/edit")
      end
    end

    it "I can click a link to delete each shelter" do
      within(:css, "section##{@shelter_1.id}") do
        click_on 'Delete Shelter'

        expect(current_path).to eq("/shelters")
        expect(current_page).to_not have_content(@shelter_1.name)
      end

      visit '/shelters'

      within(:css, "section##{@shelter_2.id}") do
        click_on 'Delete Shelter'
        expect(current_path).to eq("/shelters")
        expect(current_page).to_not have_content(@shelter_2.name)

      end
    end
  end
end
