Rails.application.routes.draw do
  resources :tasks
  resources :work_sessions do
    get :end_session
  end
  
  devise_for :users
  root to: "home#index"

end