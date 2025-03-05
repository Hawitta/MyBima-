Rails.application.routes.draw do
  resources :stripes
  resources :brokers
  resources :dependants
  resources :beneficiaries
  resources :coverdetails
  resources :admins
  resources :user_payments
  resources :users
  resources :insurance_companies
  resources :signatures



  devise_for :admins, path: "admin", controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }

  devise_scope :admins do
    delete "/admin/sign_out" => "admins/sessions#destroy"
  end

  namespace :admins do
    get "dashboard", to: "dashboard#index"
  end

  resources :covers, only: [ :new, :create ] do
    member do
      post "selected"
    end
  end
  get "cover_details", to: "coverdetails#cover_details"
  get "quote", to: "coverdetails#quote"
  get "checkout", to: "users#checkout"
  get "choose_payment", to: "stripes#choose_payment"
  post "/stripe_payment", to: "stripes#create"


  get "home/about"
  get "home/contact_us"
  root "home#index"

  get "/mpesa", to: "mpesa#index"
  post "/payments/process", to: "mpesa#send_phone_number"

  get "up" => "rails/health#show", as: :rails_health_check
end
