require 'stalker/tweet_finder'
require 'stalker/twitter_authenticator'
require 'stalker/configuration'

module Stalker
  module Resources
    class Tweet
      def self.find(username)
        tweet_finder.find(username).map { |raw_tweet| new(raw_tweet) }
      end

      def initialize(raw_tweet)
        @tweet = OpenStruct.new(raw_tweet)
      end

      def message
        @tweet.text
      end

      def at
        @tweet.created_at
      end

      def by
        @tweet.user['name']
      end

      private
      def self.authenticator
        TwitterAuthenticator.new(Configuration.key, Configuration.secret)
      end

      def self.tweet_finder
        TweetFinder.new(authenticator)
      end
    end
  end
end
