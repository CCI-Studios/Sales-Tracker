Sales::Application.routes.draw do
  resources :attempts do
    get :autocomplete_campaign_title, :on => :collection
    get :autocomplete_company_title, :on => :collection
  end
  resources :companies
  resources :campaigns

  get "pages/home"
  get "pages/about"
  get "pages/release_notes"
  
  root :to => "pages#home"
end
