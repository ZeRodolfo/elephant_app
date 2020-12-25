require 'sidekiq/web'

Rails.application.routes.draw do
  resources :parcels

  resources :office_visits

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  root to: 'home#index'

  resources :patients do
    collection do
      get 'graph'
      get 'validation'
    end
  end

  patch 'validate', to: 'patients#validate'

  resources :forms do
    collection do
      get 'export'
      post 'export'
    end
  end

  get 'graphs/index'
  post 'graphs/index'

  get 'pdf/generate_pdf'

  resources :subscriptions, only: %i[index create]
  resources :notifications, only: %i[create]
end
