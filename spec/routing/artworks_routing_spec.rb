# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArtworksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/artwork').to route_to('artworks#index')
    end

    it 'routes to #copic' do
      expect(get: '/artwork/types/copic').to route_to('artworks#copic')
    end

    it 'routes to #painting' do
      expect(get: '/artwork/types/painting').to route_to('artworks#paintings')
    end

    it 'routes to #sketch' do
      expect(get: '/artwork/types/sketch').to route_to('artworks#sketches')
    end

    it 'routes to #for_sale' do
      expect(get: '/artwork/types/for_sale').to route_to('artworks#for_sale')
    end

    it 'routes to #new' do
      expect(get: '/artwork/new').to route_to('artworks#new')
    end

    it 'routes to #show' do
      expect(get: '/artwork/1').to route_to('artworks#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/artwork/1/edit').to route_to('artworks#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/artwork').to route_to('artworks#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/artwork/1').to route_to('artworks#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/artwork/1').to route_to('artworks#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/artwork/1').to route_to('artworks#destroy', id: '1')
    end
  end
end
