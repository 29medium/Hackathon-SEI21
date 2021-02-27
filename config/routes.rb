Rails.application.routes.draw do
  resources :sessions
  resources :tasks
  devise_for :users
  root to: "pages#home"
end