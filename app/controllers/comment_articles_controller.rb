class CommentArticlesController < ApplicationController
  load_and_authorize_resource :comment_article
  def index
    @comment_articles = CommentArticle.public_article.order('created_at DESC').paginate(:page => params[:page])
  end
  def show
    @comment_articles = BaseArticle.public_article.where.not(id: @comment_article.id).order('created_at DESC').limit(5)
  end
end
