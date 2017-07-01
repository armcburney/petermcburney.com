# frozen_string_literal: true

#
# Admin controller
# Controller for website records
#
class AdminController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['USERNAME'], password: ENV['PASSWORD']
  )

  def index
    @artworks = Artwork.all
    @photos   = Photo.all
  end

  def featured
    @artworks = Artwork.where(featured: true)
    @photos   = Photo.where(featured: true)
  end

  # ***************************
  # Artwork Routes
  # ***************************

  def copic
    @artworks = Artwork.where(artwork_type: :copic)
  end

  def paintings
    @artworks = Artwork.where(artwork_type: :painting)
  end

  def sketches
    @artworks = Artwork.where(artwork_type: :sketch)
  end

  def for_sale
    @artworks = Artwork.where(for_sale: true)
  end

  # ***************************
  # Photo Routes
  # ***************************

  def location
    @photos = Artwork.where(image_type: :location)
  end

  def nature
    @photos = Artwork.where(image_type: :nature)
  end

  def wildlife
    @photos = Artwork.where(image_type: :wildlife)
  end
end
