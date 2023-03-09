require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  # authenticate :user do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  root to: 'home#index'
  post 'home/search'
end
