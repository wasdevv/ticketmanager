Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tickets
  
  # Defines the root path route ("/")
  root "tickets#index"
end
