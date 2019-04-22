class CommentsController < ApplicationController
    
    def create
      if can? :manage, Comment
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
      else
        authorize! :manage, @comment
      end
    end

    def destroy
      if can? :manage, Comment
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
      else 
        authorize! :manage, @comment
      end
    end

    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
end