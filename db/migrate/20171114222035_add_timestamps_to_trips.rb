class AddTimestampsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :timestamps, :datetime
  end
end
