class Post < ActiveRecord::Base
  belongs_to :user
  has_one :tweet
  has_many :replies, :class_name => "Post",
                     :foreign_key => "post_id"

end
