module Admin
  class NewsArticlesController < Admin::AdminApplicationController
    load_and_authorize_resource :news_article, :parent => false

    def new
    end
    def create
      if @news_article.save
        redirect_to action: :index
      else
        redirect_to :back
      end
    end

    def show
    end

    def update
      @news_article.update_attributes(news_article_params)
      redirect_to action: :index
    end

    def index
      @news_articles = NewsArticle.all
    end

    protected

    def news_article_params
      permitted_params = %i(id ingress title name content public header_photo owner_id)

      params.require(:news_article).permit(permitted_params)
    end
  end
end
