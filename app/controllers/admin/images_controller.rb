module Admin
  class ImagesController < Admin::AdminApplicationController
    def create
      puts params
      image = Image.create params.permit(:image_file, :caption)
      puts image
      render json: {
        image: image.image_file
      }, content_type: "text/html"
    end
    def index
      @images = Image.all.order('created_at DESC')
    end

  end
end
