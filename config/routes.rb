Rails.application.routes.draw do
  
  resources :users do
    get 'information', on: :member
    patch 'informationupdate', on: :member
  end
  
  resources :timecards 
   
  post '/leavingupdate',  to: 'timecards#leaving_update'
  post '/update_all', to: 'timecards#update_all'

  root 'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
