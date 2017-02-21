Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'avatars#index'

  resources :avatars

  get '/login', to: 'sessions#show'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'authenticate', to: 'authenticate', controller: 'authentication'
      resources :posts, only: [:create, :show, :index]
    end
  end
end
