Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/lists',to: 'lists#index'
  post '/lists', to: 'lists#create'
  get '/lists/new', to: 'lists#new', as: 'new_list'
  get '/lists/:id/edit', to: 'lists#edit', as: 'edit_list'
  get '/lists/:id', to: 'lists#show', as: 'list'
  patch '/lists/:id', to: 'lists#update'
  put '/lists/:id', to: 'lists#update'
  delete '/lists/:id', to: 'lists#destroy', as: 'delete_list'

  get '/show_tasks/:id', to: 'task#show_tasks', as: 'show_tasks'
  post '/show_tasks/:id', to: 'task#create'
  delete '/tasks/:id', to: 'task#destroy', as: 'delete_task'
  put '/tasks/:id', to: 'task#update', as: 'update_task'
  patch '/tasks/:id', to: 'task#update'

  root 'lists#index'
end
