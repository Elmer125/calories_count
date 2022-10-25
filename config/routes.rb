Rails.application.routes.draw do
  get 'statitics', to: 'statitics#graph'
  get '/search', to: 'search#index'
  get '/statitics/new', to: 'statitics#new'
  get '/statitics/validate', as: :email_link
  post '/statitics', to: 'statitics#create', as: :share_graph
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :calories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
end
