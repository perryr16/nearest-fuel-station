class NrelService 

  def conn
    Faraday.new('https://developer.nrel.gov/api/') do |res|
      res.params[:api_key] = ENV['NREL_KEY']
    end
  end
  
  def get_nearest_alt_fuel_station(address)
    response = conn.get('alt-fuel-stations/v1/nearest') do |res|
      res.params[:format] = 'json'
      res.params[:location] = address
    end
    JSON.parse(response.body, symbolize_names: true)
  end  

end

