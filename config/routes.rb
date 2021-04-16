Rails.application.routes.draw do
  resources :posts
  devise_for :admins
  devise_for :members
  root to: 'homes#top'

end
