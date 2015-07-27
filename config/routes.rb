Rails.application.routes.draw do
  get 'carts/index'

  root 'pages#home'
  get 'pages/about'
  get 'pages/faqs'
  get 'pages/contact'
  resources :products
end
