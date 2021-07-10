class VotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @vote = Vote.create!(user: current_user, article: @article)
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @article = @vote.article
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js
    end
  end
end
