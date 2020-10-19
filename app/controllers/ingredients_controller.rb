class IngredientsController < ApplicationController

    def index 
        @ingredients = current_user.ingredients
    end

    def show

    end

    def new
        @ingredient = Ingredient.new
    end


    private

    def ingredient_params
        params.require(:ingredient).permit(:name, :urgency, :user_id )
    end

end
