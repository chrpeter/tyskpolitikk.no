class ImagesController < ApplicationController
  def show
    path = params[:path]
    format = params[:format]
    file = open(normalize_uri("#{ENV['AWS_S3_URL']}#{path}.#{format}"))
    send_file file , type: "image/#{format}", disposition: "inline"
  end

  private
  def normalize_uri(uri)
    return uri if uri.is_a? URI

    uri = uri.to_s
    uri, *tail = uri.rpartition "#" if uri["#"]

    URI(URI.encode(uri) << Array(tail).join)
  end
end
