class AddPassengerNameStringToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :passenger_name, :string
  end
end
