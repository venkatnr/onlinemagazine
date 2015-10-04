class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def create
  	Article.create(create_params)
  	@articles = Article.all
  	respond_to :js
  end

  def create_comment
  	@article = Article.find params[:id]
  	@article.comments.create(comment_params)
  	@comments = @article.comments
  	respond_to :js
  end

  def update_comments
  	@articles = Article.includes(:comments)
  end

  private

  def create_params
  	params.require(:article).permit(:name, :description)
  end

  def comment_params
  	params.require(:article).permit(:comment_name)
  end

end
