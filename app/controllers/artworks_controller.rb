#
# Artwork controller
# Coded by: Andrew McBurney
#
class ArtworksController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['USERNAME'], password: ENV['PASSWORD'],
    except: %i[index show copic sketches paintings]
  )

  before_action :set_artwork, only: %i[show edit update destroy]

  # GET /artwork
  def index
    @artworks = Artwork.all
  end

  # GET /artwork/types/copic
  def copic
    @artworks = Artwork.where(artwork_type: :copic)
  end

  # GET /artwork/types/painting
  def paintings
    @artworks = Artwork.where(artwork_type: :painting)
  end

  # GET /artwork/types/sketch
  def sketches
    @artworks = Artwork.where(artwork_type: :sketch)
  end

  # GET /artwork/types/for_sale
  def for_sale
    @artworks = Artwork.where(for_sale: true)
  end

  # GET /artwork/:title_slug
  def show() end

  # GET /artwork/new
  def new
    @artwork = Artwork.new
  end

  # GET /artwork/:title_slug/edit
  def edit() end

  # POST /artwork
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

  # PATCH/PUT /artwork/:title_slug
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

  # DELETE /artwork/:title_slug
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
      .permit(:title, :featured, :for_sale, :artwork_type, :size, :price, :image)
  end
end
