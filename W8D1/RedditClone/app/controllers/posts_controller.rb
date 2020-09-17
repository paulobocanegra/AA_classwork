class PostsController < ApplicationController
    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        if @post.save
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to user_url(current_user.id)
        end
    end

    def show
        @post = Post.find_by(id: params[:id])        
        render :show
    end

    def edit
    end

    def update
    end
        
    def destroy
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :sub_id, :url, :context)
    end
end
