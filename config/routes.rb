Rails.application.routes.draw do
  resources :devices

  resources :site_contacts

  resources :sites

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
