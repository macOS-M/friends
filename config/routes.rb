Rails.application.routes.draw do
  devise_for :users
  resources :friends
 
  get 'home/about'
  root 'home#index'
  get 'admin/dashboard/graph'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  
  # Defines the root path route ("/")
  # root "posts#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
