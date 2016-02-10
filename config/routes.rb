Rails.application.routes.draw do
  root 'meetups#index'
  devise_for :users

  resources :meetups, only: [:new, :create, :destroy, :update]
  resources :meetups, only: [:index, :show] do
    resources :attendees, only: [:create, :show, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :locations, only: [:create, :destroy]
  end

  resources :users, only: :show

  ### API ###
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :meetups
    end
  end
end
