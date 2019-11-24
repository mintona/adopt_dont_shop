require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
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

  it "can see all shelters names" do

    expect(page).to have_content(@shelter_1.name)
    # expect(page).to have_content("#{shelter_1.name}")

    expect(page).to have_content(@shelter_2.name)
    # expect(page).to have_content("#{shelter_2.name}")
  end

  it "can see a link to edit each shelter" do
    #is this right??? is this enough??
    within(:css, "section##{@shelter_1.id}") do
      click_on 'Edit Shelter'
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    end

    visit '/shelters'

    within(:css, "section##{@shelter_2.id}") do
      click_on 'Edit Shelter'
      expect(current_path).to eq("/shelters/#{@shelter_2.id}/edit")
    end

# save_and_open_page
#     expect(page).to have_css("##{@shelter_1.id}", :text => 'Edit Shelter')
#     # within... click_link('Edit Shelter')
#
#     expect(page).to have_css("##{@shelter_2.id}", :text => 'Edit Shelter')

  end
end
