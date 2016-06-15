Rails.application.routes.draw do

  root 'pages#home'
  get 'contact' => 'pages#contact'
  get 'about' => 'pages#about'

  resources :articles

  get 'articles' => 'articles#index'
  
end
