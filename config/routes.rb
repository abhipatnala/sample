Rails.application.routes.draw do


  get   '/login', :to => 'sessions#new', :as => :login
#match '/auth/verify', :to => 'sessions#create',:via => [:get,:post]


match 'pages/confirm' => 'pages#oAuth',  :via => [:get,:post]
  
  get 'pages/index'
devise_for :users

  root  'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
