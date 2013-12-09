class Post < ActiveRecord::Base
  belongs_to :user
  has_one :tweet
  has_many :replies, :class_name => "Post",
                     :foreign_key => "post_id"

  validates :content, :secret, presence: true
  validates :content, length: { maximum: 120 }
  validates :secret, length: { maximum: 200 }
  validate :check_replies_for_proper_format

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

  private
  def check_replies_for_proper_format
    # Twitter requires that tweets sent as a reply to a user
    # start with the format "@username "

    if self.reply? && !self.content.start_with?(self.parent.formatted_sender)
      errors.add(:content, "Replies must start with the correct user name")
    end
  end
end
