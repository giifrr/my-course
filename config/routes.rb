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

  get 'analytics', to: 'pages#analytics'
  namespace :charts do 
    get 'users_created'
    get 'courses_created'
    get 'enrollments_created'
    get 'course_popularity'
  end

  root to: 'pages#home'
  get 'pages/activity'
  get 'pages/privacy_policy'
end
