Rails.application.routes.draw do
  devise_for :users
  get 'carts/index'

  root 'pages#home'
  get 'pages/about'
  get 'pages/faqs'
  get 'pages/contact'
  resources :products
end
