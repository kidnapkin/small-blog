Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get 'sessions/new'

  root      'pages#home'
  get       '/about',   to: 'pages#about'
  get       '/contact', to: 'pages#contact'
  post      '/signup',  to: 'users#create'
  get       '/signup',  to: 'users#new'
  get       '/login',   to: 'sessions#new'
  post      '/login',   to: 'sessions#create'
  delete    '/logout',  to: 'sessions#destroy'

  resources :users, except: [:edit, :index] do
    resources :posts, except: [:edit] do
      resources :comments, only: [:create]
    end
  end

  resources :votes, only: [:create, :destroy]
end
