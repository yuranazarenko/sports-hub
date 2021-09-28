# frozen_string_literal: true

Rails.application.routes.draw do
  root "application#index"
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
               passwords: "users/passwords"
             }

  get "/app", to: "application#index", as: "home"
end
