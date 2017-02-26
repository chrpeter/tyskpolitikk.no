class NewsArticlesController < ApplicationController
  load_and_authorize_resource :news_article
  def index
    @news_articles = NewsArticle.public_article.order('created_at DESC').paginate(:page => params[:page])
  end
  def show
    @news_articles = BaseArticle.public_article.where.not(id: @news_article.id).order('created_at DESC').limit(5)
  end
end
