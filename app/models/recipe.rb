class Recipe < ApplicationRecord
    has_many :users, through: user_recipes
    has_many :ingredients, through: recipe_ingredients

    def self.get_recipes_from_recipe_puppy(args)
        url = "http://www.recipepuppy.com/api/?"
        params = {
            i: args
        }
        response = RestClient.get(url, params)
        return response
    end
end
