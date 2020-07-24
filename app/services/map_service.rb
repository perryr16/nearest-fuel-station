class MapService 

  def conn 
    Faraday.new('https://www.mapquestapi.com/') do |res|
      res.params[:key] = ENV['MAPQUEST_KEY']
    end
  end 

  def get_directions(to_address, from_address)
    response = conn.get('directions/v2/route') do |res|
      res.params[:to] = to_address
      res.params[:from] = from_address
      res.params[:outFormat] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  
end