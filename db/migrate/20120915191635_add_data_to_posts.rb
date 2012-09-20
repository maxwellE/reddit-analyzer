class AddDataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :posted_at, :timestamp
    add_column :posts, :presence_score, :integer, :default => 0
    add_index :posts, :title
  end
end
