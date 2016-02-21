class User < ActiveRecord::Base
  include Bootsy::Container
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :favorited, source_type: "Post", dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :favorited, source_type: "User", dependent: :destroy
  has_attached_file :avatar, styles: { large: "500x500>", small: "200x200>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates_presence_of :email, :username, :password
  validates :password, :length => {:within => 6..40},:on => :create
  validates :password, :length => {:within => 6..40},allow_nil: true, :on => :update
  validates_uniqueness_of :email, :username
  validates_format_of :password, :with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/,:multiline => true ,:on => :create ,:on => :update
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

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
