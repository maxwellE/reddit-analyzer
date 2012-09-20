namespace :collect do
  desc "Grabs all the top posts on the Reddit page"
  task :top_posts => :environment do
    require 'net/http'
    require 'oj'
    json_data = Oj.load((Net::HTTP.get URI('http://www.reddit.com/.json')))
    post_data = json_data["data"]["children"].map{|x| x["data"]}
    top_posts = post_data.slice!(0,3)
    top_posts.each do |top|
      post = Post.find_or_initialize_by_title(top["title"])
      post.upvotes = top["score"]
      post.link = top["url"]
      post.subreddit = top["subreddit"]
      post.poster = top["author"]
      post.total_comments = top["num_comments"]
      post.posted_at = Time.at(top["created_utc"].to_i)
      if Post.where(:title => top["title"]).exists?
        post.presence_score += 3
        post.front_page = true
      else
        post.presence_score = 5
      end
      if post.highest_presence_score.nil? || post.highest_presence_score < post.presence_score
        post.highest_presence_score = post.presence_score
      end
      post.save
    end
    medium_posts = post_data.slice!(0,5)
    medium_posts.each do |medium|
      post = Post.find_or_initialize_by_title(medium["title"])
      post.upvotes = medium["score"]
      post.link = medium["url"]
      post.subreddit = medium["subreddit"]
      post.poster = medium["author"]
      post.total_comments = medium["num_comments"]
      post.posted_at = Time.at(medium["created_utc"].to_i)
      if Post.where(:title => medium["title"]).exists?
        post.presence_score += 2
        post.front_page = true
      else
        post.presence_score = 3
      end
      if post.highest_presence_score.nil? || post.highest_presence_score < post.presence_score
        post.highest_presence_score = post.presence_score
      end
      post.save
    end
    low_posts = post_data
    low_posts.each do |low|
      post = Post.find_or_initialize_by_title(low["title"])
      post.upvotes = low["score"]
      post.link = low["url"]
      post.subreddit = low["subreddit"]
      post.poster = low["author"]
      post.total_comments = low["num_comments"]
      post.posted_at = Time.at(low["created_utc"].to_i)
      if Post.where(:title => low["title"]).exists?
        post.presence_score += 1
        post.front_page = true
      else
        post.presence_score = 1
      end
      if post.highest_presence_score.nil? || post.highest_presence_score < post.presence_score
        post.highest_presence_score = post.presence_score
      end
      post.save
    end
  end
end
