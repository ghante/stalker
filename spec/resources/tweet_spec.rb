require 'rspec'
require 'stalker/resources/tweet'

module Stalker
  module Resources
    describe Tweet do
      describe '#find' do
        let(:authenticator) { double(TwitterAuthenticator) }
        let(:finder) { double(TweetFinder) }

        before do
          allow(TwitterAuthenticator).to receive(:new).with(Configuration.key, Configuration.secret).and_return(authenticator)
          allow(TweetFinder).to receive(:new).with(authenticator).and_return(finder)
        end

        it 'should find tweets' do
          expect(finder).to receive(:find).and_return([{}])

          Tweet.find('username')
        end

        it 'should return tweet objects' do
          allow(finder).to receive(:find).and_return([{}, {}])

          tweets = Tweet.find('username')

          expect(tweets.count).to eq 2
          tweets.each { |t| expect(t).to be_kind_of(Tweet) }
        end
      end

      describe '#message' do
        it 'should get text from raw tweet' do
          tweet = Tweet.new({created_at: 'time', user: {'name' => 'user name'}, text: 'message'})

          expect(tweet.message).to eq 'message'
        end
      end

      describe '#at' do
        it 'should get created_at from raw tweet' do
          tweet = Tweet.new({created_at: 'time', user: {'name' => 'user name'}, text: 'message'})

          expect(tweet.at).to eq 'time'
        end
      end

      describe '#by' do
        it 'should get name of the user who posted tweet from raw tweet' do
          tweet = Tweet.new({created_at: 'time', user: {'name' => 'user name'}, text: 'message'})

          expect(tweet.by).to eq 'user name'
        end
      end
    end
  end
end
