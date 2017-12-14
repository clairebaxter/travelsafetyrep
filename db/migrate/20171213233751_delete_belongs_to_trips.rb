class DeleteBelongsToTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :passenger_id
  end
end
