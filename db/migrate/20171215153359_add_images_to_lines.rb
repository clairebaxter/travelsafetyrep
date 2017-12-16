class AddImagesToLines < ActiveRecord::Migration
  add_attachment :lines, :image
end
