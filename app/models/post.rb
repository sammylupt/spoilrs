class Post < ActiveRecord::Base
  belongs_to :user
  has_one :tweet
  has_many :replies, :class_name => "Post",
                     :foreign_key => "post_id"

  #TODO validation: if post is a reply, the text of the content field must include the @name of the user who posted the original tweet

  include Tweetable
  include Hashable

  def to_param
    self.encrypt
  end

  def reply?
    post_id.present?
  end

  def parent
    reply? ? Post.find(self.post_id) : nil
  end

  def parent_tweet_id
    parent ? parent.tweet.twitter_id : nil
  end

  #TODO validation: if post is a reply, the text of the content field must include the @name of the user who posted the original tweet
end
