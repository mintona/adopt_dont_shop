require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
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

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content("#{shelter_1.name}")

    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content("#{shelter_2.name}")
  end
end
