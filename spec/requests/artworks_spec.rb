# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Artworks', type: :request do
  describe 'GET /artworks' do
    it 'works!' do
      get artworks_path
      expect(response).to have_http_status(200)
    end
  end
end
