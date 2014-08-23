require 'net/https'
require 'uri'
require 'json'

module Stalker
  class TwitterAuthenticator
    AUTH_URL = 'https://api.twitter.com/oauth2/token'

    def initialize(key, secret)
      @key = key
      @secret = secret
    end

    def authenticate
      uri = URI(AUTH_URL)

      req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' => 'application/json'})
      req.basic_auth @key, @secret
      req.form_data = {'grant_type' => 'client_credentials'}

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }

      if response.kind_of? Net::HTTPSuccess
        JSON.parse(response.body)
      else
        raise StandardError.new('Error while Authenticating with Twitter.')
      end
    end
  end
end
