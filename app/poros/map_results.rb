class MapResults 

  def initialize(to_address, from_address)
    @to_address = to_address
    @from_address = from_address
  end

  def service 
    service = MapService.new
    service.get_directions(@to_address, @from_address)
  end

  def distance
    service[:route][:distance].round(1)
  end

  def travel_time
    (service[:route][:time]/60.0).round(0)
  end

  def travel_instructions
    legs = service[:route][:legs][0]
    narratives = legs[:origNarrative] if legs[:origNarrative].present?
    narratives = [] if legs[:origNarrative].empty?
    narratives << legs[:maneuvers].map{|direction| direction[:narrative]}
    narratives.join(",\n then ")
  end 


  
end