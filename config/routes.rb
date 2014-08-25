Rails.application.routes.draw do

  resources :bookmarks do
    resources :favorites do
    end
  end

  root to: 'home#index'

  get "bookmarks/index"

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :incoming

end
