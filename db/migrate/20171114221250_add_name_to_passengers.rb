class AddNameToPassengers < ActiveRecord::Migration
  def change
    add_column :passengers, :passenger_name, :string
  end
end
