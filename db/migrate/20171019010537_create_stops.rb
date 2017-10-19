class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string 'stop'
    end
  end
end
