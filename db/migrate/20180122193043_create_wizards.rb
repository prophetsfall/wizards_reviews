class CreateWizards < ActiveRecord::Migration[5.1]
  def change
    create_table :wizards do |t|
      t.string :name, null: false, index: true
      t.string :img_url
      t.text :description, null: false
      t.integer :creator_id

      t.timestamps
    end
  end
end
