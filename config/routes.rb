Rails.application.routes.draw do
  resources :coverdetails

  devise_for :admins, path: "admin", controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }
  resources :admins
  namespace :admins do
    get 'dashboard', to: 'dashboard#index'
  end

  resources :user_payments
  resources :users
  resources :covers do
    member do
      post 'selected'
    end
  end
  get 'cover_details', to: 'covers#cover_details'
  get 'admin/sign_out', to: 'devise/sessions#destroy'

  
  resources :insurance_companies

  get "home/about"
  get "home/contact_us"
  root "home#index"

  get "/mpesa", to: "mpesa#index"
  post "/payments/process", to: "mpesa#send_phone_number"

  get "up" => "rails/health#show", as: :rails_health_check
end
