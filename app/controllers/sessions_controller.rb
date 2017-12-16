class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_passenger
  def create
    auth=request.env["omniauth.auth"]
    passenger=Passenger.find_by(:provider => auth["provider"], :uid => auth["uid"]) ||
      Passenger.create_with_omniauth(auth)
      session[:passenger_id] = passenger.id
      
    session[:logged_in] = true
    redirect_to trips_path, :notice => "Welcome, #{passenger.name}!"
  end
  def destroy
    session.delete(:passenger_id)
    session[:logged_in] = nil
    flash[:notice] = 'Logged out successfully.'
    redirect_to root_path, :notice => "Signed out!"
  end
  def user_params
  params.require(:passenger).permit(:picture)
  end
  def show
    #{@current_passenger.image}
  end
end