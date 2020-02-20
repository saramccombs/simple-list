Rails.application.routes.draw do
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

#TODO: Update routes comment below.
#                         Prefix Verb     URI Pattern                                                                      Controller#Action
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
#      user_ideaboard_list_tasks POST     /users/:user_id/ideaboards/:ideaboard_id/lists/:list_id/tasks(.:format)          tasks#create
#   new_user_ideaboard_list_task GET      /users/:user_id/ideaboards/:ideaboard_id/lists/:list_id/tasks/new(.:format)      tasks#new
#  edit_user_ideaboard_list_task GET      /users/:user_id/ideaboards/:ideaboard_id/lists/:list_id/tasks/:id/edit(.:format) tasks#edit
#       user_ideaboard_list_task DELETE   /users/:user_id/ideaboards/:ideaboard_id/lists/:list_id/tasks/:id(.:format)      tasks#destroy
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
#           user_ideaboard_lists POST     /users/:user_id/ideaboards/:ideaboard_id/lists(.:format)                         lists#create
#        new_user_ideaboard_list GET      /users/:user_id/ideaboards/:ideaboard_id/lists/new(.:format)                     lists#new
#       edit_user_ideaboard_list GET      /users/:user_id/ideaboards/:ideaboard_id/lists/:id/edit(.:format)                lists#edit
#            user_ideaboard_list GET      /users/:user_id/ideaboards/:ideaboard_id/lists/:id(.:format)                     lists#show
#                                DELETE   /users/:user_id/ideaboards/:ideaboard_id/lists/:id(.:format)                     lists#destroy
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
#                user_ideaboards POST     /users/:user_id/ideaboards(.:format)                                             ideaboards#create
#             new_user_ideaboard GET      /users/:user_id/ideaboards/new(.:format)                                         ideaboards#new
#            edit_user_ideaboard GET      /users/:user_id/ideaboards/:id/edit(.:format)                                    ideaboards#edit
#                 user_ideaboard GET      /users/:user_id/ideaboards/:id(.:format)                                         ideaboards#show
#                                DELETE   /users/:user_id/ideaboards/:id(.:format)                                         ideaboards#destroy
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
#               new_user_session GET      /users/sign_in(.:format)                                                         devise/sessions#new
#                   user_session POST     /users/sign_in(.:format)                                                         devise/sessions#create
#           destroy_user_session DELETE   /users/sign_out(.:format)                                                        devise/sessions#destroy
# user_github_omniauth_authorize GET|POST /users/auth/github(.:format)                                                     users/omniauth_callbacks#passthru
#  user_github_omniauth_callback GET|POST /users/auth/github/callback(.:format)                                            users/omniauth_callbacks#github
#              new_user_password GET      /users/password/new(.:format)                                                    devise/passwords#new
#             edit_user_password GET      /users/password/edit(.:format)                                                   devise/passwords#edit
#                  user_password PATCH    /users/password(.:format)                                                        devise/passwords#update
#                                PUT      /users/password(.:format)                                                        devise/passwords#update
#                                POST     /users/password(.:format)                                                        devise/passwords#create
#       cancel_user_registration GET      /users/cancel(.:format)                                                          devise/registrations#cancel
#          new_user_registration GET      /users/sign_up(.:format)                                                         devise/registrations#new
#         edit_user_registration GET      /users/edit(.:format)                                                            devise/registrations#edit
#              user_registration PATCH    /users(.:format)                                                                 devise/registrations#update
#                                PUT      /users(.:format)                                                                 devise/registrations#update
#                                DELETE   /users(.:format)                                                                 devise/registrations#destroy
#                                POST     /users(.:format)                                                                 devise/registrations#create
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
#                           user GET      /users/:id(.:format)                                                             application#show
#                           root GET      /                                                                                application#hello