require 'rails_helper'

describe 'user can find fuel station near address' do 

  it "find station near turing" do
    visit root_path 
    expect(current_path).to eq('/')

    select('Turing', from: :location)
    click_on 'Find Nearest Station'

    expect(current_path).to eq('/search')
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