class AddOriginAndAuthorToWizard < ActiveRecord::Migration[5.1]
  def change
    add_column :wizards, :origin, :string
  end
end
