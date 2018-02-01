class AddMagicSchoolToWizards < ActiveRecord::Migration[5.1]
  def change
    add_column :wizards, :magic_school_id, :integer
    add_foreign_key :wizards, :magic_schools
  end
end
