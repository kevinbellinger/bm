Rails.application.routes.draw do

  resources :bookmarks
    resources :comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]

  root to: 'home#index'

  get "home/about"
  get "bookmarks/index"

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
    resources :users

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  post :incoming, to: 'incoming#create'

end
