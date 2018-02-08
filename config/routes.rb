Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles do
    resources :comments
    resources :categories
  end
  get 'articles/:id/publish' => 'articles#publish', as: 'publish_article'
  root 'articles#index'
end