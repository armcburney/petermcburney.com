# frozen_string_literal: true

class Photo < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  has_attached_file :image, styles: { large: '1000x', medium: '500x' }

  validates :title, presence: true
  validates :slug,  presence: true

  validates :image_type, inclusion: { in: %w(location nature wildlife) }
  validates :featured,   inclusion: { in: [true, false] }

  validate :slug_is_parameterized_title

  validates_attachment_content_type :image, content_type: [
    'image/jpg', 'image/jpeg', 'image/png', 'image/gif'
  ]

  def slug_is_parameterized_title
    title.parameterize == slug
  end
end
