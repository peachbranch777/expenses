Rails.application.routes.draw do
  devise_for :users
  
  root to: 'incomes#index'
  resources :incomes, only: [:new, :create]
  resources :spendings, only: [:new, :create]
end
