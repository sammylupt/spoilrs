class Post < ActiveRecord::Base
  belongs_to :user
  has_one :tweet
  has_many :replies, :class_name => "Post",
                     :foreign_key => "post_id"

  include Tweetable
  include Hashable

  def to_param
    self.encrypt
  end

  def reply?
    post_id.present?
  end
  #TODO validation: if post is a reply, the text of the content field must include the @name of the user who posted the original tweet
end
