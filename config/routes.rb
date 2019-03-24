# frozen_string_literal: true
require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
      resources :multiple_questions
      resources :period
      resources :editorial
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  mount Sidekiq::Web => "/sidekiq"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
