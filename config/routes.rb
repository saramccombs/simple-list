Rails.application.routes.draw do
  
  resources :parents, only: [:edit, :update] do
    resources :children, only: [:new, :create, :edit, :update, :destroy]
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
