class CommentArticlesController < ApplicationController
  load_and_authorize_resource :comment_article
  def index
    @comment_articles = CommentArticle.public_article.paginate(:page => params[:page])
  end
  def show
    @comment_articles = NewsArticle.all.limit(5).order('created_at DESC')
  end
end
