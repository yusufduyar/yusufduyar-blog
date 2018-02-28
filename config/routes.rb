Rails.application.routes.draw do
  resources :users, :except => [:index, :delete]
  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  root :to => 'articles#index'
  resources :articles
  get 'articles/:id/publish' => 'articles#publish', as: 'publish_article'
  resources :categories
end