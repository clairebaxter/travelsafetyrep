module SessionsHelper
    # Logs in the given user.
    def log_in(passenger)
    session[:passenger_id] = passenger.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Passenger.find_by(id: session[:passenger_id])
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end