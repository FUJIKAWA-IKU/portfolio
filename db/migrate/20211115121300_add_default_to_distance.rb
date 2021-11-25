class AddDefaultToDistance < ActiveRecord::Migration[6.1]
  def change
    change_column_default :records, :time, from: nil, to: 0
  end
end
