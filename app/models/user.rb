class User < ActiveRecord::Base
  # Remember to create a migration!
  def client
     client = Twitter::REST::Client.new do |config|
      config.consumer_key        =  ENV['CONSUMER_KEY']
      config.consumer_secret     =  ENV['CONSUMER_SECRET']
      config.access_token        =  self.oauth_token
      config.access_token_secret =  self.oauth_secret
    end
  end
end

