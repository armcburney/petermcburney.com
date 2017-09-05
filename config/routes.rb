# frozen_string_literal: true

Rails.application.routes.draw do
  # Admin Routes
  get 'admin', to: 'admin#index'

  get 'admin/artwork', to: 'admin#artwork'
  get 'admin/copic', to: 'admin#copic'
  get 'admin/paintings', to: 'admin#paintings'
  get 'admin/sketches', to: 'admin#sketches'
  get 'admin/for_sale', to: 'admin#for_sale'

  get 'admin/photos', to: 'admin#photos'
  get 'admin/location', to: 'admin#location'
  get 'admin/nature', to: 'admin#nature'
  get 'admin/wildlife', to: 'admin#wildlife'

  # Artwork Routes
  resources :artworks, path: 'artwork'
  get 'artwork/types/copic', to: 'artworks#copic'
  get 'artwork/types/painting', to: 'artworks#paintings'
  get 'artwork/types/sketch', to: 'artworks#sketches'
  get 'artwork/types/for_sale', to: 'artworks#for_sale'
  get 'artwork/types/featured', to: 'artworks#featured'

  # Photo Routes
  resources :photos
  get 'photos/types/location', to: 'photos#location'
  get 'photos/types/nature', to: 'photos#nature'
  get 'photos/types/wildlife', to: 'photos#wildlife'
  get 'photos/types/featured', to: 'photos#featured'

  # Home Routes
  resources :home, only: :index
  get 'commissions', to: 'home#commissions'
  get 'profile', to: 'home#profile'

  root 'home#index'
end
