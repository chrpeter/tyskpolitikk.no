class ImagesController < ApplicationController
  def show
    path = params[:path]
    format = params[:format]
    file = open(URI.parse("#{ENV['AWS_S3_URL']}#{path}.#{format}"))
    send_file file , type: "image/#{format}", disposition: "inline"
  end
end
