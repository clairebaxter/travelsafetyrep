class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def current_passenger
    @current_passenger ||= Passenger.find(session[:passenger_id]) if session[:passenger_id]
  end
  helper_method :current_passenger
  
  def new_session_path(scope)
    new_passenger_session_path
  end
  
end
