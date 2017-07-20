Rails.application.routes.draw do
  root to: 'groups#index'
  resources :groups, except: [:show]
end
