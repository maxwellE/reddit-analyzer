namespace :degrade do
  task :not_front_page => :environment do
    Post.ready_for_degrade.each do |deg_post|

      deg_post.front_page = false
      deg_post.save
    end
  end
  task :post_score => :environment do
    Post.where("front_page = false and presence_score > 0").each do |deg_post|
      deg_post.presence_score -= 1
      deg_post.save
    end   
  end
end
