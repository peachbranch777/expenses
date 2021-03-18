Rails.application.routes.draw do
  devise_for :users
  
  root to: 'incomes#index'
end
