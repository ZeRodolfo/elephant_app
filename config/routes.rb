require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }

  resources :parcels

  authenticate :admin do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, path: 'users', :controllers => { :registrations => 'users/registrations' }

  root to: "static#landing"

  resources :office_visits, only: [:index, :show]

  resources :patients do
    resources :office_visits do
      post :create_multiple, on: :collection
    end

    resources :atestados
    resources :declaracoes
    resources :laudos
    resources :pareceres
    resources :relatorios

    resources :formularios do
      get 'anamnese-infantil/new', to: 'formularios#new_infantil', on: :collection
      get 'anamnese-infantil/', to: 'formularios#index_infantil', on: :collection
      get 'anamnese-infantil/:formulario_id/edit', to: 'formularios#edit_infantil', on: :collection, as: :anamnese_infantil_edit_patient_formularios
      post 'anamnese-infantil', to: 'formularios#create_infantil', on: :collection
      post 'anamnese-infantil/:formulario_id/edit', to: 'formularios#update_infantil', on: :collection

      get 'anamnese-adulto/', to: 'formularios#new_adulto', on: :collection
      get 'anamnese-adulto/new', to: 'formularios#new_adulto', on: :collection
      get 'anamnese-adulto/:formulario_id/edit', to: 'formularios#edit_adulto', on: :collection, as: :anamnese_adulto_edit_patient_formularios
      post 'anamnese-adulto', to: 'formularios#create_adulto', on: :collection
      post 'anamnese-adulto/:formulario_id/edit', to: 'formularios#update_adulto', on: :collection
    end

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

  resources :subscriptions, only: %i[index new create]

  resources :notifications, only: %i[index create]

  get :home, to: 'home#index'

  get '/landing' => "static#landing"
  get '/termos-politica' => "static#termos"
end
