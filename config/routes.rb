Rails.application.routes.draw do
  get "/app", to: "application#index", as: "home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
