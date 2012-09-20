class AddFrontPagetoPosts < ActiveRecord::Migration
  def up
    add_column :posts, :front_page, :boolean, :default => true
  end

  def down
    remove_column :posts, :front_page, :boolean
  end
end
