class TwitterApi
    def self.public_tweets(search_string)
      client.user_timeline(search_string, {count: 25})
    end
    def self.client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key = Rails.application.secrets.twitter_api_key
        config.consumer_secret = Rails.application.secrets.twitter_api_secret
      end
    end
end

