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

  has_attached_file :image, styles: { medium: '640x' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\Z}
end
