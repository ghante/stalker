require 'rspec'
require 'stalker/twitter_authenticator'
require 'webmock/rspec'

module Stalker
  describe TwitterAuthenticator do

    describe '#authenticate' do
      it 'should authenticate with twitter' do
        stub_request(:post, 'https://key:secret@api.twitter.com/oauth2/token')
        .with(:body => {"grant_type" => "client_credentials"})
        .to_return(:status => 200, :body => {}.to_json, :headers => {})

        response = TwitterAuthenticator.new('key', 'secret').authenticate

        expect(response).to be_kind_of(Hash)
      end

      it 'should raise error if response is not success' do
        stub_request(:post, 'https://key:secret@api.twitter.com/oauth2/token')
        .with(:body => {"grant_type" => "client_credentials"})
        .to_return(:status => 401)

        authenticator = TwitterAuthenticator.new('key', 'secret')

        expect { authenticator.authenticate }.to raise_error('Error while Authenticating with Twitter.')
      end
    end
  end
end
