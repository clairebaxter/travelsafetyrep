class LinesController < ApplicationController
    def index
        @lines = Line.all
    end
    
    def show
        id = params[:id]
        @line = Line.find(id)
    end
    
    def new 
        @line = Line.new
    end

    def create
        @line = Line.create!(params[:train])
        flash[:notice] = "${@line.train} was successfully created."
        redirect_to lines_path
    end
    
    def edit 
        @line = Line.find params[:id]
    end
    
    def update
        @line = Line.find params[:id]
        @line.update_attributes!(params[:line])
        flash[:notice] = "Line '#{@line.title}' was successfully updated."
        redirect_to line_path(@line)
    end
    
    def destroy
        @line = Line.find(params[:id])
        @movie.destroy
        flash[:notice] = "Line '#{@line.train}' deleted."
        redirect_to lines_path
    end
    
end