class Artwork < ApplicationRecord
  extend FriendlyId

  validates :title, presence: true

  friendly_id :title, use: :slugged
end
