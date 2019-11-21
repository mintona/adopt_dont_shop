require 'rails_helper'

RSpec.describe "create new shelter", type: :feature do
  it "can add new shelter" do

    # #visit shelter index page
     visit '/shelters'
    # # see link to create new shelter
     expect(page).to have_link("Add Shelter")
    # # click link
     click_link "Add Shelter"
    # # reroute to '/shelters/new'
     expect(current_path).to eq('/shelters/new')
    # see form for a new shelter
    # visit '/shelters/new'
    expect(page).to have_content('Name')
    expect(page).to have_content('Address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip')

    expect(page).to have_button('Add Shelter')
    # fill out form w/ name, address, city, state, zip
    fill_in 'Name', with: 'Lafayette Shelter'
    fill_in 'Address', with: '789 South Public Rd'
    fill_in 'City', with: 'Lafayette'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: "80516"
    # # click button to submit
    click_on 'Add Shelter'
    # # post request sent to '/shelters'
      # new shelter created
        # redirected to shelter index page
    expect(current_path).to eq('/shelters')
        # now it has the new shelter listed
    expect(page).to have_content('Lafayette Shelter')

  end
end
