Rails.application.routes.draw do
  mount Motor::Admin => '/super_admin'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root "home#index"

  # resources :articles

  namespace :blog do
    resources :articles
  end

  resource :user, only: %i[edit update destroy]
  resources :users, only: %i[index show]

  get "/pages/:page" => "pages#show", as: :page

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#internal_server_error', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
