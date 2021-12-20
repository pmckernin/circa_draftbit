Rails.application.routes.draw do
  resources :visits
  resources :pins
  resources :places
  resources :notes
  resources :saved_places
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
