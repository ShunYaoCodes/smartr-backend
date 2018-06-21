Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :delete]
      resources :trivia, only: [:index, :show, :create, :update, :delete]
      resources :score_records, only: [:index, :show, :create]
      post '/sessions/', to: 'sessions#create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
