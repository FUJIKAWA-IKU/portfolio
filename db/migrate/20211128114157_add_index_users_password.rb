class AddIndexUsersPassword < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :password, unique: true
  end
end
