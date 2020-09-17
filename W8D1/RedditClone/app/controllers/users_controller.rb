class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show]
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end
    def edit
        @user = User.find(params[:id])
        render :edit
    end

#      def update
#     # params[:id] is a routing parameter; more in a sec!
#     @cat = Cat.find(params[:id])
#     @cat.update!(cat_params)
#     render json: @cat
#   end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else #falsy
            flash[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to new_user_url
    end

    def is_moderator?(sub)
        sub.moderator_id == self.id
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
