class RemovePassengerNameFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :passenger_name, :current_passenger
  end
end
