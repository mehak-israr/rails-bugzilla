Rails.application.routes.draw do
  resources :projects do
    resources :bugs
  end
  root to: 'temp#home'
  #root to: 'projects#index'
  devise_for :users
end
