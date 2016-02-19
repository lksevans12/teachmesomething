class Tag < ActiveRecord::Base
  has_many :entry_tags
  has_many :posts, through: :entry_tags
end
