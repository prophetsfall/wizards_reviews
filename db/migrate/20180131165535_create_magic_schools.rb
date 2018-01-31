class CreateMagicSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :magic_schools do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
