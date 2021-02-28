Rails.application.routes.draw do
  resources :tasks do
    get :done
  end

  resources :work_sessions do
    get :end_session
  end

  devise_for :users
  root to: "home#index"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :work_sessions
      devise_scope :user do
        post "sign_in", to: "sessions#create"
      end
    end
  end
end