class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :train
      t.string :color
      t.string :borough
=begin
      t.type :primary_image
      t.type :secondary_image
=end
      t.timestamps null: false
    end
  end
end
