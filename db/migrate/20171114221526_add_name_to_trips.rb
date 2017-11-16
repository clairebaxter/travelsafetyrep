class AddNameToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :passenger_name, :string
  end
end
