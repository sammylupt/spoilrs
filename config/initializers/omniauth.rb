Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :twitter, ENV['TWITTER_AUTH_TOKEN'], ENV['TWITTER_AUTH_SECRET']
end