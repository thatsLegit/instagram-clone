# == Schema Information
#
# Table name: comments
#
#  id                 :integer          not null, primary key
#  content            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Comment < ApplicationRecord
  validates_length_of :content, minimum: 3
  validates_length_of :content, maximum: 255

  belongs_to :user
  belongs_to :post
end
