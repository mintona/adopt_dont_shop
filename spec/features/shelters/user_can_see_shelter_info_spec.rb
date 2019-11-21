require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can see shelter info" do
    shelter_1 = Shelter.create(name: "Boulder Shelter",
                              address: "123 Arapahoe Ave",
                              city: "Boulder",
                              state: "CO",
                              zip: "80301")
    # shelter_2 = Shelter.create(name: "Denver Shelter",
    #                           address: "345 Blake St",
    #                           city: "Denver",
    #                           state: "CO",
    #                           zip: "80220")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end
