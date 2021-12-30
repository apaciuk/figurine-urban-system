# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  draw :madmin
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'

    namespace :madmin do
      namespace :active_storage do
        resources :blobs
      end
      namespace :active_storage do
        resources :attachments
      end
      namespace :active_storage do
        resources :variant_records
      end
      resources :notifications
      resources :services
      resources :users
      resources :announcements
      # root to: 'dashboard#show'
    end
  end
  # get "/browse" => "browse#browse", as: :browse
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'home#index'

end
