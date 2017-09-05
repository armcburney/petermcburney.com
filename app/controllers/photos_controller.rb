# frozen_string_literal: true

#
# Photos controller
# CRUD controller for managing photos
#
class PhotosController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['USERNAME'], password: ENV['PASSWORD'],
    except: %i(index show nature wildlife location)
  )

  before_action :set_photo, only: %i(show edit update destroy)

  # ***************************
  # C - Create Methods
  # ***************************

  # GET /photos/new
  # Instantiates a new photo object
  def new
    @photo = Photo.new
  end

  # POST /photos
  # Create photo and save to database, render show view if success, else render new view
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # ***************************
  # R - Read Methods
  # ***************************

  # GET /photos
  def index
    @images = Photo.paginate(page: params[:page], per_page: 12)
  end

  # GET /photos/:title_slug
  # Show single photo in previewer view
  def show() end

  # GET /photos/types/featured
  # Show featured photos
  def featured
    @images = Photo.where(featured: true).paginate(page: params[:page], per_page: 8)
  end

  # GET /photos/types/location
  # Aggregate by location photos
  def location
    @images = Photo.where(image_type: :location).paginate(page: params[:page], per_page: 12)
  end

  # GET /photos/types/nature
  # Aggregate by nature photos
  def nature
    @images = Photo.where(image_type: :nature).paginate(page: params[:page], per_page: 12)
  end

  # GET /photos/types/wildlife
  # Aggregate by wildlife photos
  def wildlife
    @images = Photo.where(image_type: :wildlife).paginate(page: params[:page], per_page: 12)
  end

  # ***************************
  # U - Update Methods
  # ***************************

  # GET /photos/:title_slug/edit
  # Find photo to be updated
  def edit() end

  # PATCH/PUT /photos/:title_slug
  # Update photo with new params
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # ***************************
  # D - Delete Methods
  # ***************************

  # DELETE /photos/:title_slug
  # Find photo by id and delete from database, redirect to photos_url
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # ***************************
  # Private Methods
  # ***************************

  private

  def set_photo
    @photo = Photo.friendly.find(params[:id])
  end

  def photo_params
    params.require(:photo)
      .permit(:title, :featured, :image_type, :location, :image)
  end
end
