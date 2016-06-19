Rails.application.routes.draw do

  root 'pages#home'
  get 'contact' => 'pages#contact'
  get 'about' => 'pages#about'
  get 'report' => 'pages#report'

  resources :articles

  get 'signup' => 'users#new'

  resources :users, except: [:new]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :categories, except: [:destroy]
  
end
