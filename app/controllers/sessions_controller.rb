class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome]
    
    def new

    end

    def create
      @user = User.find_by(username: params[:username])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else
        flash[:error] = "Incorrect User Name or Password"
        redirect_to '/login'
      end

    end

end
