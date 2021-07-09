class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.all.with_rich_text_rich_content_and_embeds
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @new_comment = Comment.new
    #raise
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :rich_content, :publish)
  end
end
