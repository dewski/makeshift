Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :users, only: [:index, :update]

  root to: 'schedules#index'
end
