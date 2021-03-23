Rails.application.routes.draw do
  devise_for :users
  
  root to: 'incomes#index'
  resources :incomes, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :spendings, only: [:new, :create, :show, :edit, :update, :destroy]
end
