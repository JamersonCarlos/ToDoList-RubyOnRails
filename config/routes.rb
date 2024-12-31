Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  

  

  root 'lists#index'

  resources :tasks
  resources :lists

  put '/tasks/:id', to: 'tasks#update', as: 'update_task'
  put '/lists/:id', to: 'lists#update', as: 'update_list'
  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete_task'
  delete '/lists/:id', to: 'lists#destroy', as: 'delete_list'
end 
