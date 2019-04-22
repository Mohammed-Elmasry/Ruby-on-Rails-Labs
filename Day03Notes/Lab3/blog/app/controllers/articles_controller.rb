class ArticlesController < ApplicationController

    #no actions performs before authentication
    protect_from_forgery prepend: true 
    before_action :authenticate_user!
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def edit
        if can? :crud, Article
            @article = Article.find(params[:id])
            
        end
    end 

    def update
        if can? :crud, Article
            @article = Article.find(params[:id])
            
            if @article.update(article_params)
                redirect_to @article
            else
                render 'edit'
            end
        end
    end

    def create
        if can? :crud, Article
            @article = Article.new(article_params)
            @article.user = current_user
            if @article.save
                redirect_to @article #returns boolean
            else
                render "new"    
            end 
        end
    end

    def destroy
        if can? :crud, Article
            @article = Article.find(params[:id])
            @article.destroy

            redirect_to articles_path
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
