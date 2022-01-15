class RenameTweetIdColumnToComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :tweet_id, :post_id
  end
end
