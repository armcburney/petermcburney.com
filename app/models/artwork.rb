# frozen_string_literal: true

class Artwork < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged
  enum artwork_type: { copic: 'copic', painting: 'painting', sketch: 'sketch' }

  has_attached_file :image, styles: { large: '1000x', medium: '500x' }

  validates :title, presence: true
  validates :slug, presence: true
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
