Rails.application.routes.draw do
  get "user_payments/insurance_cover"
  get "user_payments/insurance_type"
  get "user_payments/personal_details"
  get "user_payments/make_payment"
  devise_for :admins, path: "admin", controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }
  resources :admins
  resources :user_payments
  resources :users
  resources :covers
  resources :insurance_companies

  get "home/about"
  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
