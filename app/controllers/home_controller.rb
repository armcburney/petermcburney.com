class HomeController < ApplicationController
  def index
    @artwork = Artwork.take(8)
  end
end
