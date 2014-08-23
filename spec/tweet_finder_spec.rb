require 'rspec'
require 'webmock/rspec'
require 'stalker/tweet_finder'

module Stalker
  describe TweetFinder do

    describe '#find'
    it 'should find tweets for given username' do
      authenticator = double(TwitterAuthenticator)
      allow(authenticator).to receive(:authenticate).and_return({'access_token' => 'token', 'token_type' => 'bearer'})

      stub_request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=@username")
      .with(:headers => {'Authorization'=>'bearer token'})
      .to_return(:status => 200, :body => {statuses: [{}]}.to_json, :headers => {})

      tweets = TweetFinder.new(authenticator).find('username')

      expect(tweets).to be_kind_of(Array)
    end
  end
end
