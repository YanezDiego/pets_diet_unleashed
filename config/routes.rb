Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/auth/github/callback' => 'sessions#create'

  resources :users

  resources :pets do
    resources :diets, only: [:new, :edit]
  end

  resources :diets

end
