require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }

  resources :parcels

  resources :office_visits

  authenticate :admin do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, path: 'users', :controllers => { :registrations => 'users/registrations' }

  root to: 'static#show', page: 'landing'

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
  resources :notifications, only: %i[index create]
  
  get "/:page" => "static#show"
end
