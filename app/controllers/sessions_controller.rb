class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome]
    
    def new

    end

    def create
      @user = User.find_by(username: params[:username])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        flash.notice = "Welcome #{@user.name}!"
        redirect_to user_path(@user)
      else
        flash.alert = "Incorrect User Name or Password"
        redirect_to '/login'
      end
    end

  def logout
    session[:user_id] = nil
    redirect_to '/login'
  end

end
