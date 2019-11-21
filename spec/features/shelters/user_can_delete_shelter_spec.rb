require 'rails_helper'

RSpec.describe "delete shelter", type: :feature do
  it "can delete existing shelter" do
    shelter_1 = Shelter.create(name: "Boulder Shelter",
                              address: "123 Arapahoe Ave",
                              city: "Boulder",
                              state: "CO",
                              zip: "80301")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link('Delete Shelter')

    click_link 'Delete Shelter'

  end
end 
