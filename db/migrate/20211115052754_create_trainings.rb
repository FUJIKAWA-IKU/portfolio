class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :parts
      t.integer :time
      t.date :trainingday

      t.timestamps
    end
  end
end
