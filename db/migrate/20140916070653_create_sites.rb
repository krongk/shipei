class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :url
      t.string :title
      t.string :keywords
      t.text :description
      t.string :is_processed, default: 'n'
      t.text :note

      t.timestamps
    end
    add_index :sites, :url
    add_index :sites, :is_processed
  end
end
