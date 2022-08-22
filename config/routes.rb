Rails.application.routes.draw do
  resources :users, only: [:index]
  devise_for :users
  resources :courses
  root to: 'pages#home'
  get 'pages/activity'
  get 'pages/privacy_policy'
end
