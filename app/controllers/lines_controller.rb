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
        params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:line])
        @line = Line.new(params_map)
       
        if @line.valid?
            byebug
            @line.save
            redirect_to lines_path
            flash[:notice] = "#{@line.train} was successfully created."
        else 
            byebug
            flash[:notice] = @line.errors.full_messages
            render "new"
        end
    end
    
    def edit 
        @line = Line.find params[:id]
    end
    
    def update
        @line = Line.find params[:id]
        params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:line])
        @line.update(params_map)
        flash[:notice] = "#{@line.train} was successfully updated."
        redirect_to line_path(@line)
    end
    
    def destroy
        @line = Line.find params[:id]
        #params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:line])
        @line.destroy #(params_map)
        flash[:notice] = "#{@line.train} was successfully deleted."
        redirect_to lines_path
    end
    
end