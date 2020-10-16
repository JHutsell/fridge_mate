class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

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
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def update
        if @user.update_attributes(username: params[:new_user_name])
            flash[:success] = "User Name Updated!"
        else
            flash[:errors] = @user.errors.full_messages
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
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

end
