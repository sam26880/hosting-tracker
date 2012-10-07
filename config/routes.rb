Hosting::Application.routes.draw do
  resources :customers
  root to: 'dashboard#index'
end
