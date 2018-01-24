class AddNameTooUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string, null: false
  end
end
