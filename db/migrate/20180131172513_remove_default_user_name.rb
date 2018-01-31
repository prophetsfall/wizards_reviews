class RemoveDefaultUserName < ActiveRecord::Migration[5.1]
  def up
    change_column_default(:users, :user_name, nil)
  end
  def down
    change_column_default(:users, :user_name, 'user')
  end
end
