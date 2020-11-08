class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :current_user, :logged_in?, :current_user_ingredients #makes methods available to views


    def current_user
        User.find_by(id: session[:user_id])
    end

    def current_user_ingredients
        current_user.ingredients.map do |ingredient|
            ingredient.name.downcase
        end
    end

    def logged_in?
        current_user != nil
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
    end

end
