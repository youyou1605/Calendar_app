# config/routes.rb
Rails.application.routes.draw do
  resources :events
  get 'events.json', to: 'events#index_json'
  root 'events#index'
end