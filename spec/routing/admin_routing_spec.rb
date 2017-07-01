# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin').to route_to('admin#index')
    end

    context 'artwork' do
      it 'routes to #copic' do
        expect(get: '/admin/copic').to route_to('admin#copic')
      end

      it 'routes to #paintings' do
        expect(get: '/admin/paintings').to route_to('admin#paintings')
      end

      it 'routes to #sketches' do
        expect(get: '/admin/sketches').to route_to('admin#sketches')
      end

      it 'routes to #for_sale' do
        expect(get: '/admin/for_sale').to route_to('admin#for_sale')
      end
    end

    context 'photos' do
      it 'routes to #location' do
        expect(get: '/admin/location').to route_to('admin#location')
      end

      it 'routes to #nature' do
        expect(get: '/admin/nature').to route_to('admin#nature')
      end

      it 'routes to #wildlife' do
        expect(get: '/admin/wildlife').to route_to('admin#wildlife')
      end
    end
  end
end
