class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :train
      t.current_passenger.name :passenger_name
      t.belongs_to :passenger, index: true
      t.timestamps
    end
  end
end