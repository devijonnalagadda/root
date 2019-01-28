Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :admins #, controllers: { sessions: "admins/sessions" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'attachments/index'
  get 'attachments/new'
  get 'attachments/create'
  get 'attachments/destroy'
  resources :tasks
  resources :projects
  resources :organizations
  root 'pages#home'
   

   resources :attachments, only: [:index, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
