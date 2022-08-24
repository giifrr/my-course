Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :update]
  devise_for :users
  resources :courses do
    resources :lessons
  end
  root to: 'pages#home'
  get 'pages/activity'
  get 'pages/privacy_policy'
end
