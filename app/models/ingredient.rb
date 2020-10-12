class Ingredient < ApplicationRecord
    belongs_to :user
    has_many :recipes, through: :recipe_ingredients
    
end
