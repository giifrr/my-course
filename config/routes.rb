Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :update]
  devise_for :users

  resources :courses do
    get :mylearning, :mycourse,  on: :collection
    resources :lessons
    resources :enrollments, only: %i[ new create edit update destroy ]
  end

  resources :enrollments, only: %i[ index show ]
  get 'mystudents', to: 'enrollments#mystudents'

  namespace :charts do 
    get 'users_created'
  end

  root to: 'pages#home'
  get 'pages/activity'
  get 'pages/privacy_policy'
end
