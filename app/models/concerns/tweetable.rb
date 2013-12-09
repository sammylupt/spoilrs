module Tweetable

  def tweet!
    TweetSender.new(self)
  end

  def tweet_body
    "#{self.content} http://spoil.rs/#{self.encrypt}"
  end
end
