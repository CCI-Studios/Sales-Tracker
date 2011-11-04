Sales::Application.routes.draw do
  resources :attempts
  resources :contacts
  resources :campaigns

  get "pages/home"
  get "pages/about"
  
  root :to => "pages#home"
end
