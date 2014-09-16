Rails.application.routes.draw do
  resources :devices
  resources :site_contacts
  resources :sites

  root to: 'visitors#index'
  devise_for :users
  resources :users
  match '/s/:short_title', to: "visitors#show", via: :get
end
