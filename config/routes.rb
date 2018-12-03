Rails.application.routes.draw do
  devise_for :users

  resources :offices, only: %i[index new create show] do
    resources :bookings, only: :create
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
