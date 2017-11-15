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
        # params_map = ActiveSupport::HashWithIndifferentAccess.new(params[trips_params])
        # @trip = Trip.new(params_map)
        # if @trip.save
        #     redirect_to trips_path
        #     flash[:notice] = "Thank you, #{@trip.passenger_name}, your #{@trip.train} trip was successfully created."
        # else 
        #     render "new"
        # end
        @trip = Trip.create!(trip_params)
        if @trip.save
            redirect_to trips_path
            flash[:notice] = "Thank you, #{@passenger}, your #{@trip.train} trip was successfully created."
        else 
            render "new"
        end
        #flash[:notice] = "Thank you, #{@trip.passenger_name}, your #{@trip.train} trip was successfully created."
        #redirect_to trips_path
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
    
    private 
    def trip_params
        #trip_params.require(:trip).permit(:passenger_name,:train,:timestamps)
    end
    
end