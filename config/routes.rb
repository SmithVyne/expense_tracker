# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :expenses
  resources :categories
  resources :users, only: [:create, :show]
end
