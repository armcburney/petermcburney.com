class Artwork < ApplicationRecord
  extend FriendlyId

  validates :title, presence: true

  friendly_id :title, use: :slugged

  has_attached_file :image, styles: { large: '1000x', medium: '500x' }

  validates_attachment_content_type :image, content_type: [
    'image/jpg', 'image/jpeg', 'image/png', 'image/gif'
  ]
end
