class User < ActiveRecord::Base
  has_many :posts

  def self.find_or_create_by_omniauth(hash)
    token = hash.credentials.token
    secret = hash.credentials.secret
    #TODO: build in what happens if a Twitter user changes their name
    # The token and secret will stay the same, but the other stuff may change
    user = User.find_or_create_by(token: token, secret: secret)

    # TODO: refactor this stuff
    user.tid = hash.uid
    user.name = hash.info.name
    user.screen_name = hash.info.nickname
    user.save
    user
  end
end
