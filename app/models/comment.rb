class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post
  # Remember to create a migration!
end
