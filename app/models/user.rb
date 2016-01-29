class User < ActiveRecord::Base
  has_secure_password

  has_many :posts

  validates_presence_of :email, :username, :password
  validates_uniqueness_of :email, :username
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
