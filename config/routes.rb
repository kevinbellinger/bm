Rails.application.routes.draw do

  resources :bookmarks

  root to: 'home#index'

  get "home/about"

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  post :incoming, to: 'incoming#create'

end
