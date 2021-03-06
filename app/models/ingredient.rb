class Ingredient < ApplicationRecord
    belongs_to :user
    has_many :recipes, through: :recipe_ingredients
    
    validates_presence_of :name, :user_id
    validates_inclusion_of :urgency, :in => [true, false]
end
