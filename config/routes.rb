Rails.application.routes.draw do


  #resources :folders do
    #resources :links
  #end

  root 'folders#index'
  resources :folders
  resources :links

end
