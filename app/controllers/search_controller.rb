class SearchController < ApplicationController 

  def index 
    @facade = SearchIndexFacade.new(params[:location])
  end


  
end