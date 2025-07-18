Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  root to: 'angular#index'
  namespace :api, constraints: { format: :json } do

  end

  match '*url', to: 'angular#index', via: :get
end
