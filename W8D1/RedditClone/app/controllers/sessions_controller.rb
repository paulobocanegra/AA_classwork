class SessionsController < ApplicationController
    before_action :require_logged_in, only:[:destroy]
    
    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user 
            login!(@user)
            redirect_to subs_url
        else
            flash[:errors] = ["Invalid Username or Password"] 
            redirect_to new_session_url
        end
    end
    def destroy
        logout!
        redirect_to new_session_url
    end

    def new
    end
end
