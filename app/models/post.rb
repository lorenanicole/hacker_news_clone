class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :user
  has_one :postvote
  # Remember to create a migration!
end
