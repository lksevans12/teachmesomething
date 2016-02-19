class Favorite < ActiveRecord::Base
  belongs_to :favorited, polymorphic: true
  belongs_to :user
  belongs_to :post
end
