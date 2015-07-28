Rails.application.routes.draw do
  devise_for :users
  get 'carts' => 'carts#index'
  get 'carts/clear' => 'carts#clearCart'
  get 'carts/:id' => 'carts#add'

  root 'products#index'
  get 'pages/about'
  get 'pages/faqs'
  get 'pages/contact'
  resources :products
end
