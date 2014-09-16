class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.string :os
      t.string :preview_image
      t.string :vertical_bg
      t.string :horizontal_bg
      t.string :screen_size

      t.timestamps
    end
    add_index :devices, :name
  end
end
