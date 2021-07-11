class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.article = @article
    if @comment.save
      redirect_to article_path(@article, anchor: 'comment-' + @comment.id.to_s)
    else
      redirect_to article_path(@article), notice: "Oups, #{@comment.errors.values.join}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end
