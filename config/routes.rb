OnlineStore::Application.routes.draw do
  resources :products

  mount Sidekiq::Web => '/work'

  root 'products#index'
end
