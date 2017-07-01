# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @artworks = Artwork.take(8)
    @photos   = Photo.take(8)
  end

  def commissions() end

  def profile() end
end
