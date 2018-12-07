Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'users#dashboard'

  resources :offices do
    resources :bookings, except: %i[index show new] do
      resources :reviews, except: %i[index show]
    end
    resources :office_attachments, except: %i[index show] do
      get 'background', to: 'office_attachments#background'
    end

  end

  root to: 'pages#home'
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
end
