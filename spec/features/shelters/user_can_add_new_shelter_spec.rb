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
    # expect(page).to have_content 'Name'
    # expect(page).to have_field '#Address'
    # expect(page).to have_field '#City'
    # expect(page).to have_field '#State'
    # expect(page).to have_field '#Zip'
    # fill out form w/ name, address, city, state, zip
    fill_in 'name', with: 'Lafayette Shelter'
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
    expect(page).to have_content('789 South Public Rd')
    expect(page).to have_content('Lafayette')
    expect(page).to have_content('CO')
    expect(page).to have_content('80516')





  end
end
