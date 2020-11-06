Rails.application.routes.draw do
  root to:'sessions#welcome'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#logout'
  resources :user_recipes
  resources :recipe_ingredients
  resources :recipes do
    collection do 
      post :search, to: 'recipes#get_recipes'
    end
  end
  resources :ingredients
  resources :users
  # get 'search', to: 'recipes#get_recipes'
  # get 'search_results', to: 'recipes#get_recipes', as: :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
