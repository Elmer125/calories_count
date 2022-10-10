Rails.application.routes.draw do
  get 'statitics', to: 'statitics#graph'
  get '/search', to: 'search#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/about', to: 'pages#about'
  resources :calories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
end
