Rails.application.routes.draw do
  resources :tasks do
    get :done
  end

  resources :work_sessions do
    get :end_session
  end

  devise_for :users
  root to: "home#index"

  namespace :api do
    namespace :v1 do
      resources :work_sessions
    end
  end
end