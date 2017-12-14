class CreateJoinTableTripsPassengers < ActiveRecord::Migration
  def change
    create_join_table :trips, :passengers do |t|
      t.index [:trip_id, :passenger_id]
      t.index [:passenger_id, :trip_id]
    end
  end
end
