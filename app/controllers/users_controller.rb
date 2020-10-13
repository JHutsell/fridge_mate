class UsersController < ApplicationController

    def show
        find_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            edirect_to new_user_path
        end
    end

    private
    
    def find_user
        @user = User.find_by(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :user_name, :password
    end
end
