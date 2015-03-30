Rails.application.routes.draw do


  devise_for :users
  resources :users do
    resources :tweets
  end
end
