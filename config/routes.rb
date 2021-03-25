Rails.application.routes.draw do
  devise_for :users

  root to: "tweets#index"
  resources :tweets, only:[:new,:create,:index, :show, :destroy, :edit] do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update]
  resources :relationships, only: [:create, :destroy]
end

