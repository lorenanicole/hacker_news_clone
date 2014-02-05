require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  validates :username, uniqueness: {message: "A username already exists with that email!" }

  has_many :posts
  has_many :comments

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password_attempt)
    self.password == password_attempt
  end
  # Remember to create a migration!
end
