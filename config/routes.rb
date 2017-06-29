Rails.application.routes.draw do
  resources :photos
  get 'admin', to: 'admin#index'
  get 'admin/copic', to: 'admin#copic'
  get 'admin/paintings', to: 'admin#paintings'
  get 'admin/sketches', to: 'admin#sketches'
  get 'admin/for_sale', to: 'admin#for_sale'

  resources :artworks, path: 'artwork'
  get 'artwork/types/copic', to: 'artworks#copic'
  get 'artwork/types/painting', to: 'artworks#paintings'
  get 'artwork/types/sketch', to: 'artworks#sketches'
  get 'artwork/types/for_sale', to: 'artworks#for_sale'

  resources :home, only: :index
  get 'commissions', to: 'home#commissions'
  get 'profile', to: 'home#profile'

  root 'home#index'
end
