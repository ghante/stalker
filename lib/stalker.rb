require "stalker/version"
require 'stalker/resources/tweet'

module Stalker
  class Application
    def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
      @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
    end

    def execute!
      stalk(@argv)
    end

    private
    def stalk(username)
      tweets = ::Stalker::Resources::Tweet.find(username)

      tweets.each do |tweet|
        @stdout.puts "\n"
        @stdout.puts "message : #{tweet.message}"
        @stdout.puts "at : #{tweet.at}"
        @stdout.puts "by : #{tweet.by}"
        @stdout.puts "\n"
      end
    end
  end

end
