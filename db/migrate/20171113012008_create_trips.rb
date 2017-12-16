class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :train
      #t.current_passenger.name :passenger_name, array: true
      t.timestamps
    end
  end
end
