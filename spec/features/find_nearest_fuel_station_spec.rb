require 'rails_helper'

describe 'user can find fuel station near address' do 

  before :each do 
    @expected_station_name = 'Seventeenth Street Plaza'
    @expected_station_fuel_type = 'ELEC'
    @expected_station_access_times = 'MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified'

    @expected_travel_distance = '0.1'
    @expected_travel_time = '1'
    @expected_travel_instructions = "Start out going southeast on 17th St toward Larimer St/CO-33., then 1225 17TH ST is on the right."
  end


  it "find station near turing", :vcr do
    visit root_path 
    expect(current_path).to eq('/')

    select('Turing', from: :location)
    click_on 'Find Nearest Station'
save_and_open_page
    expect(current_path).to eq('/search')

    within('.closest-station') do 
      expect(page).to have_content("Station Name: #{@expected_station_name}")
      expect(page).to have_content("Fuel Type: #{@expected_station_fuel_type}")
      expect(page).to have_content("Access Times: #{@expected_station_access_times}")
    end

    within('.station-directions') do
      expect(page).to have_content("Distance to station: #{@expected_travel_distance} Miles")
      expect(page).to have_content("Travel Time: #{@expected_travel_time} Minutes")
      expect(page).to have_content("Travel Instructions")
      expect(page).to have_content(@expected_travel_instructions)
    end
  end
  
end
# As a user
# When I visit "/"
# And I select "Turing" form the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"