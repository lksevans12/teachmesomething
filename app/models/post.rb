class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :reviews, as: :reviewable, dependent: :destroy

  # def self.get_post_by_trending
  # Post.all.each.sort {|x| x.comments.where("created_at < ?", 5.hours.ago).count}
  # end


  def self.get_posts_by_newest
    order(created_at: :desc).limit(20)
  end

  def average_rating
    if self.reviews.length > 0
      ratings = self.reviews
      sum = 0
      ratings.each do |rating|
        sum += rating.score
      end
      return sum / ratings.length
    else
      return 0
    end
  end


end
