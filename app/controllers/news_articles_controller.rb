class NewsArticlesController < ApplicationController
  load_and_authorize_resource :news_article
  def index

    @news_articles = NewsArticle.public_article.paginate(:page => params[:page])
  end
  def show
    @news_articles = NewsArticle.all
  end
end
