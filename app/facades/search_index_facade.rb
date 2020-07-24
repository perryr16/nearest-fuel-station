class SearchIndexFacade 

  attr_reader :location
  def initialize(location)
    @location = location
  end

  def nrel_results
    NrelResults.new(address)
  end

  def station_name
    nrel_results.station_name
  end
  
  def fuel_type
    nrel_results.fuel_type
  end
  
  def access_times
    nrel_results.access_times
  end

  def station_address
    nrel_results.station_address
  end

  def address
    @location.gsub(',','').gsub(' ','+')
  end

  def map_results
    MapResults.new(station_address, address)
  end

  def distance_to_station 
    map_results.distance
  end

  def travel_time
    map_results.travel_time
  end

  def travel_instructions
    map_results.travel_instructions
  end

  
end