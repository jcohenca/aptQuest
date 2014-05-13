Rails.application.routes.draw do
 
  devise_for :users
  root 'welcome#index'
  resources :users
  resources :searches

  # get '/', to: 

end


# $('#value').children()[0].value