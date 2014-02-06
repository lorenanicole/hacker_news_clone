class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post
  has_one :commentvote
  # Remember to create a migration!
end
