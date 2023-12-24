Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tickets do
    member do
      
    end
  end

  # Defines the root path route ("/")
  root "tickets#index"
end
