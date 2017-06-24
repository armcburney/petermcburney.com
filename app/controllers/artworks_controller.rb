class ArtworksController < ApplicationController
  before_action :set_artwork, only: %i[show edit update destroy]

  # GET /artworks
  def index
    @artworks = Artwork.all
  end

  # GET /artworks/:title_slug
  def show() end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
  end

  # GET /artworks/:title_slug/edit
  def edit() end

  # POST /artworks
  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artworks/:title_slug
  def update
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artworks/:title_slug
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artworks_url, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_artwork
    @artwork = Artwork.friendly.find(params[:id])
  end

  def artwork_params
    params.require(:artwork)
      .permit(:title, :image_url, :featured, :for_sale, :type, :size, :price)
  end
end
