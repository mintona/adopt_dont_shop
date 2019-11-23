require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the shelters pets index" do

    it "I see a link to add a new pet to the shelter" do
      shelter_1 = Shelter.create(name: "Boulder Shelter",
                                  address: "123 Arapahoe Ave",
                                  city: "Boulder",
                                  state: "CO",
                                  zip: "80301")

      visit "shelters/#{shelter_1.id}/pets"

      click_link "Add Pet"

      expect(current_path).to eq("/shelters/:shelter_id/pets/new")

    end
  end
end
