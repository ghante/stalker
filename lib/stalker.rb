require "stalker/version"
require 'stalker/resources/tweet'

module Stalker
  class Application
    def self.stalk(username)
      tweets = ::Stalker::Resources::Tweet.find(username)

      tweets.each do |tweet|
        puts "\n"
        puts "message : #{tweet.message}"
        puts "at : #{tweet.at}"
        puts "by : #{tweet.by}"
        puts "\n"
      end
    end
  end

end
