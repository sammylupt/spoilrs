class TweetSender

  attr_accessor :client, :post

  def initialize(post)
    @post = post
    @client = client(post.user)
    dispatch_tweet
  end

  def client(user)
    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_AUTH_TOKEN']
      config.consumer_secret = ENV['TWITTER_AUTH_SECRET']
      config.oauth_token = user.token
      config.oauth_token_secret = user.secret
    end
  end  

  def dispatch_tweet
    # TODO: check if the hash comes back from Twitter
    # TODO: error handling if things mess up?

    twitter_hash = post.reply? ? send_tweet_as_reply : send_tweet
    twitter_id = twitter_hash[:attrs][:id]
    update_record(twitter_id)
  end

  def update_record(twitter_id)
    self.post.create_tweet(twitter_id: twitter_id)
  end

  def send_tweet
    @client.update(self.post.tweet_body)
  end

  def send_tweet_as_reply
    @client.update(self.post.tweet_body, {:in_reply_to_status_id => self.post.parent_tweet_id})
  end
end

# @attrs=
#   {:created_at=>"Sun Dec 08 21:59:21 +0000 2013",
#    :id=>409804416666320896,
#    :id_str=>"409804416666320896",
#    :text=>"testing testing",
#    :source=>
#     "<a href=\"http://scottluptowski.com/sandbox/spoil2/connect.php\" rel=\"nofollow\">SLtesting</a>
#    :truncated=>false,
#    :in_reply_to_status_id=>nil,
#    :in_reply_to_status_id_str=>nil,
#    :in_reply_to_user_id=>nil,
#    :in_reply_to_user_id_str=>nil,
#    :in_reply_to_screen_name=>nil,
#    :user=>
#     {:id=>14076386,
#      :id_str=>"14076386",
#      :name=>"scott luptowski",
#      :screen_name=>"scottluptowski",
#      :location=>"new york city",
#      :description=>
#       "digital strategist turned student #rails dev at @flatironschool. world traveler, music listen
#      :url=>"http://t.co/3C9xUtWUvo",
#      :entities=>
#       {:url=>
#         {:urls=>
#           [{:url=>"http://t.co/3C9xUtWUvo",
#             :expanded_url=>"http://www.scottluptowski.com",
#             :display_url=>"scottluptowski.com",
#             :indices=>[0, 22]}]},
#        :description=>{:urls=>[]}},
#      :protected=>false,
#      :followers_count=>635,
#      :friends_count=>509,
#      :listed_count=>31,
#      :created_at=>"Tue Mar 04 04:49:47 +0000 2008",
#      :favourites_count=>81,
#      :utc_offset=>-21600,
#      :time_zone=>"Central Time (US & Canada)",
#      :geo_enabled=>true,
#      :verified=>false,
#      :statuses_count=>4285,
#      :lang=>"en",
#      :contributors_enabled=>false,
#      :is_translator=>false,
#      :profile_background_color=>"131516",
#      :profile_background_image_url=>
#       "http://a0.twimg.com/profile_background_images/126279251/bg-x.png",
#      :profile_background_image_url_https=>
#       "https://si0.twimg.com/profile_background_images/126279251/bg-x.png",
#      :profile_background_tile=>false,
#      :profile_image_url=>
#       "http://pbs.twimg.com/profile_images/378800000495417721/1b0cf8b8ae54a6a904a9cefd1cf2432a_norma
#      :profile_image_url_https=>
#       "https://pbs.twimg.com/profile_images/378800000495417721/1b0cf8b8ae54a6a904a9cefd1cf2432a_norm
#      :profile_link_color=>"009999",
#      :profile_sidebar_border_color=>"EEEEEE",
#      :profile_sidebar_fill_color=>"EFEFEF",
#      :profile_text_color=>"333333",
#      :profile_use_background_image=>false,
#      :default_profile=>false,
#      :default_profile_image=>false,
#      :following=>false,
#      :follow_request_sent=>false,
#      :notifications=>false},
#    :geo=>nil,
#    :coordinates=>nil,
#    :place=>nil,
#    :contributors=>nil,
#    :retweet_count=>0,
#    :favorite_count=>0,
#    :entities=>{:hashtags=>[], :symbols=>[], :urls=>[], :user_mentions=>[]},
#    :favorited=>false,
#    :retweeted=>false,
#    :lang=>"en"}>
