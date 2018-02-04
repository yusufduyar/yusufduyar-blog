Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end