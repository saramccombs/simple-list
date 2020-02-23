Rails.application.routes.draw do
  resources :groups
  resources :chores
  
  resources :users, only: [] do
    resources :ideaboards, only: [:new, :edit, :create, :update, :destroy, :show] do
      resources :lists, only: [:new, :edit, :create, :update, :destroy, :show] do
        resources :tasks, only: [:new, :edit, :create, :update, :destroy]
      end
    end
  end
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/:id', to: 'application#show', as: 'user'
  root 'application#hello'
end