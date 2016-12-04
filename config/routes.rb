Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'sessions/new'

  root      'pages#home'
  get       '/about',   to: 'pages#about'
  get       '/contact', to: 'pages#contact'
  post      '/signup',  to: 'users#create'
  get       '/signup',  to: 'users#new'
  get       '/login',   to: 'sessions#new'
  post      '/login',   to: 'sessions#create'
  delete    '/logout',  to: 'sessions#destroy'

  resources :users do
    resources :posts do
      resources :comments
    end

    resources :comments do
      resources :votes, shallow: true
    end
  end
end
