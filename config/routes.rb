require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
  root to: 'home#index'
  get 'home/index'
  post 'home/search'
end
