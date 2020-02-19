Rails.application.routes.draw do
  resources :tasks
  resources :lists
  resources :ideaboards
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
