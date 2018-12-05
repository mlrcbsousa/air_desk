Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'users#dashboard'

  resources :offices do
    resources :bookings, only: :create do
      resources :reviews, only: %i[new create]
    end
    resources :office_attachments, only: %i[new create edit update destroy]
  end

  root to: 'pages#home'
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
