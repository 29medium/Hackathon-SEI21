Rails.application.routes.draw do
  resources :work_sessions
  get 'home/index'
  resources :tasks
  devise_for :users
  root to: "home#index"
end