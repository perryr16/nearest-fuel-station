class NrelResults 
  
  def initialize(address)
    @address = address
  end

  def service 
    NrelService.new.get_nearest_alt_fuel_station(@address)
  end

  def station_name
    service[:fuel_stations][0][:station_name]
  end
  
  def fuel_type
    service[:fuel_stations][0][:fuel_type_code]
  end
  
  def access_times
    service[:fuel_stations][0][:access_days_time]
  end

  def station_address
    station = service[:fuel_stations][0] 
    street = station[:street_address] 
    city = station[:city] 
    state = station[:state] 
    zip = station[:zip] 
    "#{street} #{city} #{state} #{zip}"
  end
  
end