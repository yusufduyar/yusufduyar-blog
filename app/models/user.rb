class User < ApplicationRecord
  has_secure_password
  # has_many :posts
  # has_many :comments
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /@/
end
