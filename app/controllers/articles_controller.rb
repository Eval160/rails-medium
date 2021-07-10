class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_params, only: [:show, :update]

  def index
    @articles = Article.where(publish: true).order(created_at: :desc).with_rich_text_rich_content_and_embeds
    search = params["search"]
    if search.present?
      title = search["title"]
      @articles = Article.where("title ILIKE ?", "%#{title}%").where(publish: true).order(created_at: :desc).with_rich_text_rich_content_and_embeds
    end
  end

  def show
    @comments = @article.comments
    @new_comment = Comment.new
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

  def update
    @article.publish = true
    if @article.save
      redirect_to root_path
    end
  end

  def unpublished
    @articles = Article.where(publish: false, user: current_user)
  end


  private

  def set_params
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :rich_content, :publish)
  end
end
