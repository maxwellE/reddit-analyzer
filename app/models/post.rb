class Post < ActiveRecord::Base
  attr_accessible :link, :poster, :subreddit, :title, :total_comments, :upvotes, :presence_score, :posted_at

  def self.ready_for_degrade
    where("updated_at < ? and front_page = true", Chronic.parse("10 minutes ago"))
  end
end
