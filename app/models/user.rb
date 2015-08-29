class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_many :authentication_tokens
  has_secure_password
  validates :password, length: { minimum: 5 }
end
