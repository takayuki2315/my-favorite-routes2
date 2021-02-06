Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: 'routes#index'
  resources :routes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end