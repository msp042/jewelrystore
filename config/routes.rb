Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "necklaces#index"
  resources :bookmarks
  resources :categories
  devise_for :users
  resources :users
  resources :necklaces
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
