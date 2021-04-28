Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :edit] do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
  end
  resources :groups, only: [:index, :new, :create, :edit, :update]
  resources :group_post
  resources :members do
      get :following, :followers
  end
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: [:index] do
      delete 'destroy_all' => 'notifications#destroy_all', as: 'destroy_all'
  end
  devise_for :admins
  devise_for :members
  root to: 'homes#top'
end
