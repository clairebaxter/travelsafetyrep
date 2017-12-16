class TripsController < ApplicationController
    before_action :force_log_in
    def index
        @trips = Trip.order(:passenger_name).page params[:page]
        
        @trips_grid = initialize_grid(Trip, per_page: 5 )
    end

    def show
        @passenger = Passenger.find(session[:passenger_id])
        @trip = Trip.find(params[:id])
        @passengerString = ''
        #byebug
        @trip.passenger.each do |p|
            @passengerString += p.name + " "
        end
    end
    
    def newtrip 
        @trip = Trip.new
       
    end

    def join
        @trip = Trip.find params[:id]
        @passenger = Passenger.find(session[:passenger_id])
        #byebug
        if @trip.passenger.take(session[:passenger_id]) != []
            flash[:notice] = "You can not join this trip, you are already on it!"
        else
            @trip.passenger << @passenger
            flash[:notice] = "You have successfully joined this #{@trip.train} trip."
        end
        if @trip.save
            #flash[:notice] = "You have successfully joined this #{@trip.train} trip."
        end
        redirect_to trips_path  
    end
    
    def create
        @passenger = Passenger.find(session[:passenger_id])
        params[:trip][:passenger_name] = @passenger.name
        #params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:trip])
        @trip = Trip.new(trip_params)
       
        if @trip.valid?
            #byebug
            @trip.save
            #byebug
            redirect_to trips_path
            #byebug
            flash[:notice] = "Thank you, #{@trip.passenger_name}, your #{@trip.train} trip was successfully created."
        else 
            flash[:notice] = @trip.errors.full_messages
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
        @trip.destroy
        
        flash[:notice] = "Your #{@trip.train} train trip was successfully deleted."
        redirect_to trips_path
    end
    
    private 
        def trip_params
            params.require(:trip).permit(:train,:passenger_name, :timestamps)
        end
    
end