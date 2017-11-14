class TripsController < ApplicationController
    def index
        @passenger = Passenger.find(session[:passenger_id])
        @trips = Trip.where(:passenger_id => @passenger)
    end
    
    def show
        @trip = Trip.find(params[:id])
    end
    
    def new 
        @trip = Trip.new
    end

    def create
        params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:trip])
        @trip = Trip.new(params_map)
        @trip.passenger_id = session[:passenger_id]
        @trip.train = session[:train]
        @trip.passenger_name = session[:passenger_name]
        if @trip.save
            redirect_to trips_path
            flash[:notice] = "Thank you, #{@trip.passenger_name}, your #{@trip.train} trip was successfully created."
        else 
            render "new"
        end
    end
    
    def edit 
        @trip = Trip.find params[:id]
    end
    
    def update
        @trip = Trip.find params[:id]
        params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:trip])
        @trip.update(params_map)
        flash[:notice] = "Your #{@trip.train} train trip was successfully updated."
        redirect_to @trip
    end
    
    def destroy
        @trip = Trip.find params[:id]
        #params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:line])
        @trip.destroy #(params_map)
        flash[:notice] = "Your #{@trip.train} train trip was successfully deleted."
        redirect_to trips_path
    end
    
end