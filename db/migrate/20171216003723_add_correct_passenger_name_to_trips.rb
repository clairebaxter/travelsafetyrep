class AddCorrectPassengerNameToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :passenger_name, :string, array: false
  end
end
