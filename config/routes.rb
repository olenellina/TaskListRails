Rails.application.routes.draw do
  root 'homepages#index'

  get 'users/index' => 'users#index', as: 'users_index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/:id/edit' => 'users#edit', as: 'users_edit'

  patch 'users/:id/update' => 'users#update', as: 'users_update'

  get 'users/destroy'

  get 'homepages/index', as: 'index'

  get 'sessions/create'

  delete 'sessions/:id/destroy' => 'sessions#destroy', as: 'session_delete'

  get 'tasks/index' => 'tasks#index', as: 'tasks_index'

  post 'tasks/create' => 'tasks#create', as: 'tasks_create'

  get 'tasks/show/:id' => 'tasks#show', as: 'tasks_show'

  get 'tasks/new' => 'tasks#new', as: 'tasks_new'

  get 'tasks/:id/edit' => 'tasks#edit', as: 'tasks_edit'

  put 'tasks/:id/update' => 'tasks#update', as: 'tasks_update'

  put 'tasks/:id/complete' => 'tasks#complete', as: 'tasks_complete'

  delete 'tasks/:id/destroy' => 'tasks#destroy', as: 'tasks_delete'

  # Tells oAuth where to send user after login
  get "/auth/:provider/callback", to: "sessions#create"

end
