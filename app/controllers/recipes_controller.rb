class RecipesController < ApplicationController

    def show
    end

    def index
        
    end

    def get_recipes
        url = "http://www.recipepuppy.com/api/?i=#{params["args"]}"

        recipes = RestClient.get(url)
        @response = JSON.parse(recipes)["results"]
    end

end
