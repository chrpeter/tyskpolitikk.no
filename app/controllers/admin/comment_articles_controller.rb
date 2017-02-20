module Admin
  class CommentArticlesController < Admin::AdminApplicationController
    load_and_authorize_resource :comment_article, :parent => false

    def new
    end
    def create
      if @comment_article.save
        redirect_to action: :index
      else
        redirect_to :back
      end
    end
    def update
      @comment_article.update_attributes(comment_article_params)
      redirect_to action: :index
    end
    def index
      @comment_articles = CommentArticle.all
    end
    def edit
    end
    protected

    def comment_article_params
      permitted_params = %i(id ingress title name content public header_photo)

      params.require(:comment_article).permit(permitted_params)
    end
  end
end
