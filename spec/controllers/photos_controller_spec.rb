require 'rails_helper'

RSpec.xdescribe PhotosController, type: :controller do
  include AuthHelper

  let(:valid_attributes) do
    {
      title: 'Title',
      featured: false,
      image_type: 'location',
      location: 'New York, NY',
      image_file_name: 'sample_image.jpg',
      image_content_type: 'image/jpg',
      image_file_size: 1.megabyte
    }
  end

  # Fails since requires 'featured' to exist and be 'true' or 'false'
  let(:invalid_attributes) do
    {
      title: 'Title',
      image_type: 'location',
      location: 'New York, NY',
      image_file_name: 'sample_image.jpg',
      image_content_type: 'image/jpg',
      image_file_size: 1.megabyte
    }
  end

  before(:each) do
    http_login
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Photo.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      photo = Photo.create! valid_attributes
      get :show, params: { id: photo.to_param }
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      photo = Photo.create! valid_attributes
      get :edit, params: { id: photo.to_param }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Photo' do
        expect do
          post :create, params: { photo: valid_attributes }
        end.to change(Photo, :count).by(1)
      end

      it 'redirects to the created photo' do
        post :create, params: { photo: valid_attributes }
        expect(response).to redirect_to(Photo.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { photo: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested photo' do
        photo = Photo.create! valid_attributes
        put :update, params: { id: photo.to_param, photo: new_attributes }
        photo.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the photo' do
        photo = Photo.create! valid_attributes
        put :update, params: { id: photo.to_param, photo: valid_attributes }
        expect(response).to redirect_to(photo)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        photo = Photo.create! valid_attributes
        put :update, params: { id: photo.to_param, photo: invalid_attributes }
        expect(response).not_to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested photo' do
      photo = Photo.create! valid_attributes
      expect do
        delete :destroy, params: { id: photo.to_param }
      end.to change(Photo, :count).by(-1)
    end

    it 'redirects to the photos list' do
      photo = Photo.create! valid_attributes
      delete :destroy, params: { id: photo.to_param }
      expect(response).to redirect_to(photos_url)
    end
  end
end
