Rails.application.routes.draw do
  devise_for :users

  resources :offices, only: %i[index new create show] do
    resources :bookings, only: :create do
      resources :reviews, only: :create
    end
  end

  root to: 'pages#home'
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
