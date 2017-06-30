# frozen_string_literal: true

class AdminController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['USERNAME'], password: ENV['PASSWORD']
  )

  def index
    @artworks = Artwork.all
  end

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
end
