# typed: strict

# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  caption            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_content_type :string
#  image_file_name    :string           not null
#  image_file_size    :integer          not null
#  image_updated_at   :datetime         not null
#
class Post < ApplicationRecord
  validates :image, presence: true
  validates :user_id, presence: true
  validates_length_of :caption, minimum: 3
  validates_length_of :caption, maximum: 255

  has_attached_file :image, styles: { medium: '640x' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\Z}

  belongs_to :user
  has_many :comments, dependent: :destroy
end
