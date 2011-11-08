Sales::Application.routes.draw do
  resources :user_sessions, :only => [:new, :create, :destroy]
  match '/login',  :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'
  
  resources :attempts do
    get :autocomplete_campaign_title, :on => :collection
    get :autocomplete_company_title, :on => :collection
  end
  resources :sales do
    get :autocomplete_campaign_title, :on => :collection
    get :autocomplete_company_title, :on => :collection
  end
  resources :companies
  resources :campaigns
  resources :users

  get "pages/home"
  get "pages/about"
  get "pages/release_notes"
  
  root :to => "pages#home"
end
