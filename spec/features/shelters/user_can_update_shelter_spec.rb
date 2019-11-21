require 'rails_helper'

RSpec.describe "edit shelter", type: :feature do
  it "can update existing shelter" do
    shelter_1 = Shelter.create(name: "Boulder Shelter",
                              address: "123 Arapahoe Ave",
                              city: "Boulder",
                              state: "CO",
                              zip: "80301")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link('Update Shelter')

    click_link 'Update Shelter'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    expect(page).to have_content('Name')
    expect(page).to have_content('Address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip')

    # how do i test that the form auto populated with existing info?

    # fill out all the stuff you want to change
    fill_in 'Name', with: 'Boulder Animal Shelter'

    expect(page).to have_button('Update Shelter')

    click_on 'Update Shelter'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content('Boulder Animal Shelter')
    expect(page).to_not have_content('Boulder Shelter')
# Should all new information be filled out every time they visit this form??
  end
end
