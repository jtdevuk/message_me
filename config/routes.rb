Rails.application.routes.draw do
  root to: 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  resources :users

  mount ActionCable.server, at: '/cable'
end
