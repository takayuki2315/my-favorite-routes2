Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: 'routes#index'
  resources :routes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
  
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end