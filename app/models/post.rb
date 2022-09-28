# typed: strict

class Post < ApplicationRecord
  validates :image, presence: true

  has_attached_file :image, styles: { medium: '640x' }
  validates_attachement_content_type :image, content_type: %r{\Aimage/.*\Z}
end
