class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :current_user, :logged_in? #makes methods available to views


    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user != nil
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
    end
end
