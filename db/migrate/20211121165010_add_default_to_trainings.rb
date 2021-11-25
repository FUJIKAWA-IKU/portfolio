class AddDefaultToTrainings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :trainings, :time, from: nil, to: 0
  end
end
