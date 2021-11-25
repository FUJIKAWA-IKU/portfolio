class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.date :runday
      t.float :distance

      t.timestamps
    end
  end
end
