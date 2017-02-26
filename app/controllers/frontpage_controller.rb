class FrontpageController < ApplicationController

  def index
    twitter_client = intialize_client
    @facebook_feed = intialize_fb_client
    @tweets = twitter_client.home_timeline.take(10)


    @base_articles = BaseArticle.public_article.order('created_at DESC').limit(9)
    @is_frontpage = true;
  end
  def intialize_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CKEY']
      config.consumer_secret     = ENV['TWITTER_CSECRET']
      config.access_token        = ENV['TWITTER_ATOKEN']
      config.access_token_secret = ENV['TWITTER_ASECRET']
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
