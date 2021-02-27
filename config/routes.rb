Rails.application.routes.draw do
  resources :tasks
  resources :work_sessions
  get 'home/index'
  devise_for :users
  root to: "home#index"
end