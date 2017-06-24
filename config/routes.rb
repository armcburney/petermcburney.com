Rails.application.routes.draw do
  resources :artworks, path: 'artwork'
  resources :home, only: :index

  root 'home#index'
end
