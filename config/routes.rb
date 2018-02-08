Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles do
    resources :comments
    resources :categories
  end
  root 'articles#index'
end