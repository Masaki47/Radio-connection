Rails.application.routes.draw do
  resources :posts
  resources :groups, only: [:index, :new, :create, :edit, :update]
  resources :group_post
  resources :members
  devise_for :admins
  devise_for :members
  root to: 'homes#top'
end
