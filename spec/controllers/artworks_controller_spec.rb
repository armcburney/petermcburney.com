require 'rails_helper'

RSpec.describe ArtworksController, type: :controller do
  let(:valid_attributes) do
    { title: "Peter's awesome artwork" }
  end

  let(:invalid_attributes) do
    { title: "Peter's awesome artwork" }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Artwork.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      artwork = Artwork.create! valid_attributes
      get :show, params: { id: artwork.to_param }
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
      artwork = Artwork.create! valid_attributes
      get :edit, params: { id: artwork.to_param }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Artwork' do
        expect do
          post :create, params: { artwork: valid_attributes }
        end.to change(Artwork, :count).by(1)
      end

      it 'redirects to the created artwork' do
        post :create, params: { artwork: valid_attributes }
        expect(response).to redirect_to(Artwork.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { artwork: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested artwork' do
        artwork = Artwork.create! valid_attributes
        put :update, params: { id: artwork.to_param, artwork: new_attributes }
        artwork.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the artwork' do
        artwork = Artwork.create! valid_attributes
        put :update, params: { id: artwork.to_param, artwork: valid_attributes }
        expect(response).to redirect_to(artwork)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        artwork = Artwork.create! valid_attributes
        put :update, params: { id: artwork.to_param, artwork: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested artwork' do
      artwork = Artwork.create! valid_attributes
      expect do
        delete :destroy, params: { id: artwork.to_param }
      end.to change(Artwork, :count).by(-1)
    end

    it 'redirects to the artworks list' do
      artwork = Artwork.create! valid_attributes
      delete :destroy, params: { id: artwork.to_param }
      expect(response).to redirect_to(artworks_url)
    end
  end
end
