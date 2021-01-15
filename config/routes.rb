Rails.application.routes.draw do
  devise_for :users

  root to: "tweets#index"
  resources :tweets, only:[:new,:create,:index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
end
