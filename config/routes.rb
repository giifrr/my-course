Rails.application.routes.draw do
  resources :lessons
  resources :users, only: [:index, :edit, :update]
  devise_for :users
  resources :courses
  root to: 'pages#home'
  get 'pages/activity'
  get 'pages/privacy_policy'
end
