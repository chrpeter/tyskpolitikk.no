class NewsArticlesController < ApplicationController
  load_and_authorize_resource :news_article
  def index
    @news_articles = NewsArticle.public_article.order('created_at DESC').paginate(:page => params[:page])
  end
  def show
    @news_articles = NewsArticle.all.limit(5).order('created_at DESC')
  end
end
