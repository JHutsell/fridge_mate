class Recipe < ApplicationRecord
    belongs_to :user, through: user_recipe
    has_many :ingredients, through: recipe_ingredient
end
