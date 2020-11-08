class RecipesController < ApplicationController

    def show
    end

    def index
        
    end

    def get_recipes
        url = "http://www.recipepuppy.com/api/?i=#{params[:args]}"
        
        searched_ingredients_array = params[:args].downcase.split(/\W+/)
        
        if !(searched_ingredients_array - current_user_ingredients).empty?
            flash.alert = "You do not currently have all necessary ingredients!"
        end

        recipes = RestClient.get(url)
        @response = JSON.parse(recipes)["results"]
    end

end
