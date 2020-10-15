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
            redirect_to new_user_path
        end
    end

    def update
        if @user.update_attributes(user_name: params[:new_user_name])
            flash[:success] = "User Name Updated!"
        else
            flash[:errors] = @user.error.full_messages
            redirect_to user_path(@user)
        end
    end

    def destroy
        @user.destroy
        # redirect_to login_path
        # login page in progress
    end

    private
    
    def find_user
        @user = User.find_by(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :user_name, :password)
    end
end
