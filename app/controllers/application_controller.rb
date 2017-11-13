class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_current_passenger
  protected
  def set_current_passenger
    @current_passenger ||= Passenger.where(:id => session[:passenger_id])
    redirect_to login_path and return unless @current_passenger
  end
  
  helper_method :current_passenger
  
  private
  def current_passenger
    @current_passenger ||= Passenger.find(session[:passenger_id]) if session[:passenger_id]
  end
 
  
 
  
end
