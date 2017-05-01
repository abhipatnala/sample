Rails.application.routes.draw do

match '/oath2/callback', :to => 'application#hai',:via => [:get,:post]

	root 'application#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
