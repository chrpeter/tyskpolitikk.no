module Admin
  class ImagesController < Admin::AdminApplicationController

    def new
    end
    def create
      puts params
      puts @image
      render :nothing => true
    end
    def update
      @comment_article.update_attributes(comment_article_params)
      redirect_to action: :index
    end
    def index
      @comment_articles = CommentArticle.all.order('created_at DESC')
    end
    def edit
    end
    protected

    def image_params
      permitted_params = %i(image_file caption)

      params.require(:image_file).permit(permitted_params)
    end
  end
end
