class Postvote < ActiveRecord::Base

  belongs_to :post
  # Remember to create a migration!
end
