class LinesController < ApplicationController
    def index
        @lines = Line.all
    end
    public
    def show
        id = params[:id]
        @line = Line.find(id)
    end

end