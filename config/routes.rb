Rails.application.routes.draw do
  resources :messages
  devise_for :users
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "rooms#index"
end