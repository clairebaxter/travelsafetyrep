class AddPassengerIdstoTrips < ActiveRecord::Migration
  def change
    add_column :trips, :passenger_id, :integer
  end
end
