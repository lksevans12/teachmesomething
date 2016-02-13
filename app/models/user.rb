class User < ActiveRecord::Base
  has_secure_password

  has_many :posts

  PASSWORD_FORMAT = /\A
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  /x

  validates_presence_of :email, :username
  validates :password, :length => {:within => 6..40},format: {with: PASSWORD_FORMAT},:on => :create
  validates :password,:length => {:within => 6..40},format: {with: PASSWORD_FORMAT}, allow_nil: true ,:on => :update
  validates_uniqueness_of :email, :username
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
