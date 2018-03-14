Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :users, only: [:index, :update]
  resources :schedules

  root to: 'schedules#index'
end
