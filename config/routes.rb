require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  mount Sidekiq::Web => '/sidekiq'

  root to: 'home#index'
  post 'home/search'
end
