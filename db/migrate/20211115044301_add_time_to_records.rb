class AddTimeToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :time, :integer
  end
end
