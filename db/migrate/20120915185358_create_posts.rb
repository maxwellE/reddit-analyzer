class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :upvotes
      t.string :title
      t.string :link
      t.string :subreddit
      t.string :poster
      t.integer :total_comments

      t.timestamps
    end
  end
end
