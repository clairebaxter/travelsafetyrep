class LinesController < ApplicationController
    def index
        @lines = Line.all
    end
    
    def show
        id = params[:id]
        @line = Line.find(id)
    end

end