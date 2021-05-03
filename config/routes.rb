Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  resources :posts, only: [:index, :create, :show, :edit] do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
  end
  resources :groups, only: [:index, :new, :show, :create, :edit, :update]
  resources :group_post
  resources :members, only: [:show, :edit, :update] do
      get :following, :followers
  end
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: [:index] do
      delete 'destroy_all' => 'notifications#destroy_all', as: 'destroy_all'
  end

  root to: 'homes#top'
end
