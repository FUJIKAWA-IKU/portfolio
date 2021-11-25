class AddUserIdToTrainings < ActiveRecord::Migration[6.1]
  def change
    add_column :trainings, :user_id, :integer
  end
end
