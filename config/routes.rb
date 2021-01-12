require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }

  resources :parcels

  resources :office_visits

  post 'create_multiple_office_visits', to: 'office_visits#create_multiple'

  authenticate :admin do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, path: 'users', :controllers => { :registrations => 'users/registrations' }

  root to: "static#landing"

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

  resources :subscriptions, only: %i[index create] do 
    get :gate, on: :collection
  end

  resources :notifications, only: %i[index create]

  get :home, to: 'home#index'
  
  get '/landing' => "static#landing"
  get '/termos-politica' => "static#termos"
end
