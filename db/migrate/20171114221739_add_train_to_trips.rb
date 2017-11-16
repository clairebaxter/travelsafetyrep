class AddTrainToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :train, :string
  end
end
