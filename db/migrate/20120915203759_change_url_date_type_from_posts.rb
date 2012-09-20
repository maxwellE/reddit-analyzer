class ChangeUrlDateTypeFromPosts < ActiveRecord::Migration
  def up
    change_column :posts, :link, :text
    change_column :posts, :title, :text
  end

  def down
    change_column :posts, :link, :string
    change_column :posts, :title, :string
  end
end
