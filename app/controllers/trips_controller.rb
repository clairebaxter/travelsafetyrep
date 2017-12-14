class TripsController < ApplicationController
    before_action :force_log_in
    def index
        #@trips = Trip.all
        #@passenger = Passenger.find(session[:passenger_id])
        #@trips = Trip.where(:passenger_id => @passenger)
        @trips = Trip.order(:passenger_name).page params[:page]
        
        @trips_grid = initialize_grid(Trip,
        per_page: 5 )
    end

    def show
        @trip = Trip.find(params[:id])
        @passengerString = ''
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
        @trip.passenger << @passenger
        if @trip.save
            flash[:notice] = "You have successfully joined this #{@trip.train} trip."
        end
        redirect_to trips_path  
    end
    
    def create
        
        params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:trip])
        
        @trip = Trip.new(params_map)
        if @trip.valid?
            @trip.save
            redirect_to trips_path
            #byebug
            flash[:notice] = "Thank you, #{@trip.passenger_name}, your #{@trip.train} trip was successfully created."
        else 
            flash[:notice] = @trip.errors.full_messages
            render "new"
        end
        #redirect_to trip_path
    end
    
    def edit 
        @trip = Trip.find params[:id]
    end
    
    def update
        @trip = Trip.find params[:id]
        #byebug
        params_map = ActiveSupport::HashWithIndifferentAccess.new(params[:trip])
        @trip.update(params_map)
        #byebug
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
            params.require(:trip).permit(:passenger_name,:train,:timestamps)
        end
    
end