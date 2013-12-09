class User < ActiveRecord::Base
  has_many :posts

  def self.find_or_create_by_omniauth(hash)
    token = hash["credentials"]["token"]
    secret = hash["credentials"]["secret"]
    tid = hash["uid"]

    user = User.find_or_create_by(token: token, secret: secret, tid: tid) do |u|
      #these bits can change, so write them each login
      u.name = hash["info"]["name"]
      u.screen_name = hash["info"]["nickname"]
      u.save
    end
  end
end