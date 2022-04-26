Rails.application.routes.draw do
  resources :projects do
    resources :bugs
  end
  devise_for :users
  root to: "projects#index"
end
