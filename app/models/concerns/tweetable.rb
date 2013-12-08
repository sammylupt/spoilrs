module Tweetable

  def tweet!
    TweetSender.new(self)
    #binding.pry
    # TODO: this method will build the tweet text and then pass it off to a Twitter API class which handles the actual tweeting
    # something like TwitterAPI.send(user, tweet_body) ?
  end

  def tweet_body
    "#{self.content} http://spoil.rs/#{self.encrypt}"
  end
end
