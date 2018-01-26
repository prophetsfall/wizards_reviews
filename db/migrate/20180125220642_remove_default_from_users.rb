class RemoveDefaultFromUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :user_name, :string, null: false
  end
  def down
    change_column :users, :user_name, :string, null: false, default: "user"
  end
end
