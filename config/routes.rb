Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :categories

      resources :users

      resources :necklaces

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
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
