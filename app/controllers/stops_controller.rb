class StopsController < ApplicationController

    def show
        id = params[:id]
        
        @stops = Stop.find(params[:id])
    end

    def stops
        @stops = Stop.all
        
    end
    
    #def stopusers
     #   id = params[:id]
      #  @stops = Stop.find(id)
    #end
end