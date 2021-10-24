# frozen_string_literal: true

Rails.application.routes.draw do
  root "application#index"
  devise_for :users,
             controllers: {
               sessions:      "users/sessions",
               registrations: "users/registrations",
               passwords:     "users/passwords"
             }

  get "/app", to: "application#index", as: "home"
  namespace :admin do
    get "/", to: "base#index", as: "main_page"
    resources :users, only: [:index]
    namespace :information_architectures do
      get "/", action: :index
      resources :categories, only: [:create]
    end
  end
end
