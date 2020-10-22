class IngredientsController < ApplicationController

    def index 
        @ingredients = current_user.ingredients
    end

    def show

    end

    def new
        @ingredient = Ingredient.new
    end

    def create 
        params[:ingredient][:user_id] = current_user.id
        @ingredient = Ingredient.create(ingredient_params)
        if @ingredient.valid?
            flash.notice = "Ingredient Added!"
            redirect_to user_path(current_user)
        else
            flash.alert = @ingredient.errors.full_messages
            redirect_to user_path(current_user)
        end
    end

    def edit

    end

    def update 
        params[:ingredient][:user_id] = current_user.id
        if @ingredient.update(ingredient_params)
            flash.notice = "Ingredient Updated!"
        else
            flash.alert = @ingredient.errors.full_messages
            redirect_to user_path(current_user)
        end
    end

    def destroy
        @ingredient.destroy
    end


    private

    def ingredient_params
        params.require(:ingredient).permit(:name, :urgency, :user_id )
    end

end
