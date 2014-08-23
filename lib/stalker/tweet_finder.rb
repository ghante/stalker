require 'stalker/resources/tweet'

module Stalker
  class TweetFinder
    SEARCH_URL = 'https://api.twitter.com/1.1/search/tweets.json'

    def initialize(authenticator)
      @authenticator = authenticator
    end

    def find(username)
      uri = URI(SEARCH_URL)
      uri.query = URI.encode_www_form({q: "@#{username}"})

      req = Net::HTTP::Get.new(uri, initheader = {'Content-Type' => 'application/json'})
      req['Authorization'] = "#{token_type} #{access_token}"

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http|
        http.request(req)
      }

      JSON.parse(response.body)['statuses']

    end

    private
    def access_token
      authenticate['access_token']
    end

    def token_type
      authenticate['token_type']
    end

    def authenticate
      @auth_response ||= @authenticator.authenticate
    end
  end
end
