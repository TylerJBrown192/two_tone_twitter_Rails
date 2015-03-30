Rails.application.routes.draw do
  root :to => 'users#index'

  devise_for :users
  
  resources :users do
    resources :tweets
  end
end
