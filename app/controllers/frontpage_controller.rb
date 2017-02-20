class FrontpageController < ApplicationController

  def index
    twitter_client = intialize_client
    @facebook_feed = intialize_fb_client
    puts @facebook_feed
    @tweets = twitter_client.search("from:tyskpolitikk", result_type: "recent").take(10)
    @base_articles = BaseArticle.public_article.order('created_at DESC').limit(10)
    @is_frontpage = true;
  end
  def intialize_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_KEY']
      config.access_token        = ENV['CONSUMER_KEY']
      config.access_token_secret = ENV['CONSUMER_KEY']
    end
  end

  def intialize_fb_client
    oauth = Koala::Facebook::OAuth.new(ENV['FB_ID'], ENV['FB_SECRET'], 'http://tyskpolitikk.no')
    graph = Koala::Facebook::API.new(oauth.get_app_access_token)
    fields = ['id','picture','message']
    feed = graph.get_connection('tyskpolitikk.no', 'feed', { limit: 10, fields: fields })
    ActiveSupport::JSON.decode(feed.to_json)
  end
end
