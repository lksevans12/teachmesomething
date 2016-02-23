class Post < ActiveRecord::Base

  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :entry_tags
  has_many :tags, through: :entry_tags
  has_attached_file :photo, styles: { large: "500x500>", small: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  # def self.get_post_by_trending
  # Post.all.each.sort {|x| x.comments.where("created_at < ?", 5.hours.ago).count}
  # end

  validates :body, length: { minimum: 1000, too_short: "must have at least 250 words" }
  validates_presence_of :title, :body, :tags

  before_save :all_tags


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


  def all_tags=(titles)
    self.tags = titles.split(",").map do |title|
      Tag.where(title: title.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:title).join(", ")
  end

  def posts_with_tag(tag)
    Post.where
  end


end
