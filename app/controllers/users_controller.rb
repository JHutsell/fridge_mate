class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    helper_method :logged_in_user?

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
            flash.notice = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def update
        if @user.update(user_params)
            flash.notice = "User Name Updated!"
        else
            flash.alert = @user.errors.full_messages
            redirect_to user_path(@user)
        end
    end

    def destroy
        @user.destroy
        # redirect_to login_path
        # login page in progress
    end

    def logged_in_user?
        @user == current_user
    end

    private
    
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

end
