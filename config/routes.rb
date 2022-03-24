Rails.application.routes.draw do
  resources :webhook_requests, only: :index
  delete "webhook_requests", to: "webhook_requests#delete_all", as: :delete_all_requests
  match "create_webhook_request", to: "webhook_requests#create", via: :all

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "webhook_requests#index"
end
