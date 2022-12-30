class CommentsController < ApplicationController

    def index
        @comment = Comment.all
    end

    def show
        
    end
    
    def new 
        @comment = Comment.new
        @post = Post.find_by(params[:id])
    end
 
    def create
        @post = Post.find_by(params[:id])
        @comment = @post.comments.create(comment_params.merge(post_id: @post.id, user_id: current_user.id))
        redirect_to post_path(@post)
    end
    
    def destroy
            @article = Article.find(params[:article_id])
            @comment = @article.comments.find(params[:id])
            @comment.destroy
            redirect_to article_path(@article)
    end

    private 
        def comment_params
            params.require(:comment).permit(:body, :post_id, :user_id)
        end
end
