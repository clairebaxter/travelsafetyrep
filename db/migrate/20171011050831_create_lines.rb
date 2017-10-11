class CreateLines < ActiveRecord::Migration
  def change
    create_table 'lines' do |t|
      t.string 'train'
      t.string 'color'
      t.string 'borough'
    end
  end
end
