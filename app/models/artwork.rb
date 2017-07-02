# frozen_string_literal: true

class Artwork < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged
  has_attached_file :image, styles: { large: '800x', medium: '400x' }

  validates :title, presence: true
  validates :slug, presence: true
  validates :media, presence: true
  validates :size, presence: true
  validates :price, presence: true, if: :for_sale?
  validates :artwork_type, inclusion: { in: %w(copic painting sketch) }
  validates :featured, inclusion: { in: [true, false] }
  validates :for_sale, inclusion: { in: [true, false] }

  validate :slug_is_parameterized_title

  validates_attachment_content_type :image, content_type: [
    'image/jpg', 'image/jpeg', 'image/png', 'image/gif'
  ]

  def slug_is_parameterized_title
    title.parameterize == slug
  end

  def for_sale?
    for_sale == true
  end
end
