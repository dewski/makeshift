Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :users, only: [:index, :update]
  resources :schedules do
    member do
      get :import
    end

    resources :invitations, controller: 'schedule_invitations'
  end

  root to: 'schedules#index'
end
