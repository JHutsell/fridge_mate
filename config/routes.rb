Rails.application.routes.draw do
  root to:'sessions#welcome'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#logout'
  resources :user_recipes
  resources :recipe_ingredients
  resources :recipes
  resources :ingredients
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
