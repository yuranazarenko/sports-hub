# frozen_string_literal: true

Rails.application.routes.draw do
  root "application#index"
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations"
             }
  get "/app", to: "application#index", as: "home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
