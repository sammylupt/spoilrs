class User < ActiveRecord::Base
  has_many :posts

  def self.find_or_create_by_omniauth(hash)
    user_token = hash.credentials.token
    user_secret = hash.credentials.secret
    #TODO: build in what happens if a Twitter user changes their name
    # The token and secret will stay the same, but the other stuff may change
    user = User.find_or_create_by(token: user_token, secret: user_secret)

    # TODO: refactor this stuff
    user.tid = hash.uid
    user.name = hash.info.name
    user.screen_name = hash.info.nickname
    user.save
    user
  end
end
