class Comment < ApplicationRecord
  validates_length_of :content, minimum: 3
  validates_length_of :content, maximum: 255

  belongs_to :user
  belongs_to :post
end
