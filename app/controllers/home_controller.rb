class HomeController < ApplicationController
  def index
    @artwork = Artwork.take(8)
  end

  def commissions() end

  def profile() end
end
