class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_passenger
  def create
    auth=request.env["omniauth.auth"]
    passenger=Passenger.where(:provider => auth["provider"], :uid => auth["uid"]) ||
      Passenger.create_with_omniauth(auth)
    session[:passenger_id] = passenger.id
    redirect_to lines_path
  end
  def destroy
    session.delete(:passenger_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to lines_path
  end
end