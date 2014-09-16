class CreateSiteContacts < ActiveRecord::Migration
  def change
    create_table :site_contacts do |t|
      t.references :site, index: true
      t.string :email
      t.string :qq
      t.string :phone
      t.string :is_processed, default: 'n'
      t.text :note

      t.timestamps
    end
    add_index :site_contacts, :is_processed
  end
end
