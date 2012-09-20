class AddHighestPresenceScoreToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :highest_presence_score, :integer
  end
end
