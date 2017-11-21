Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  post 'static_pages/thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #rerooted from 'static_pages#landing_page'
  root 'static_pages#landing_page'

end
