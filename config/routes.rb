Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :users, :except => [:index, :delete]
  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  root :to => 'articles#index'
  resources :articles
  get 'articles/:id/publish' => 'articles#publish', as: 'publish_article'
  resources :categories
  get '/admin', to: 'sessions#new', as: 'admin'
  get '/drafts', to: 'articles#drafts', as: 'draft_articles'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
end