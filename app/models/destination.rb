class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent
        self.posts.min_by(5) { |post| post.created_at }
    end

    def featured_post
        self.posts.max_by { |post| post.likes }
    end

    def avg_age
        sum = 0
        blogger_arr = self.bloggers.uniq
        blogger_arr.each do |blogger|
            sum += blogger.age
        end
        sum / blogger_arr.count
    end


end
