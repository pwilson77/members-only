Rails.application.routes.draw do
  #get 'password_resets/new'
  #get 'password_resets/edit'
  #get 'sessions/new'
  root 'static_pages#home'
  #get  'static_pages/home'
  

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :posts , only: [:new, :create, :index]

  #resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
