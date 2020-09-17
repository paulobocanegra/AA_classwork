class SubsController < ApplicationController
    before_action :require_moderator, only:[:edit, :update]
     def require_moderator
        @user = User.find_by(id: params[:user_id])
        @sub = Sub.find_by(id: params[:id])
        redirect_to sub_url(@sub) unless @user.is_moderator?(@sub)
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to sub_url(@sub)
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = params[:user_id]    
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to sub_url(@sub)
        end
    end

    def index 
        @subs = Sub.all
        render :index
    end
    
    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
    
end
