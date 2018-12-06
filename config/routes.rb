Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'users#dashboard'

  resources :offices do
    resources :bookings, only: %i[create edit update destroy] do
      resources :reviews, only: %i[new create edit update destroy]
    end
    resources :office_attachments, only: %i[create edit update destroy]
  end

  root to: 'pages#home'
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
end
