class IngredientsController < ApplicationController
    before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

    def index 
        @ingredients = current_user.ingredients
    end

    def show
        find_ingredient
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
        redirect_to user_path(current_user)
    end


    private

    def ingredient_params
        params.require(:ingredient).permit(:name, :urgency, :user_id, :notes )
    end

    def find_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

end
