require 'spec_helper'

describe Post do

  #WebMock.stub_request(:any, "https://api.twitter.com").to_return(status: 200, body: "stubbed", headers: {})

  before :each do 
    @u = create(:user)
    @post = @u.posts.create(attributes_for(:post))
  end

  context "non-reply post" do 

    it "knows it is not a reply" do 
      expect(@post.reply?).to eq false
    end

    it "does not have a parent" do 
      expect(@post.parent).to eq nil
    end

    it "does not have a parent tweet id " do 
      expect(@post.parent_tweet_id).to eq nil
    end
  end

  context do "reply post" 
    before :each do 
      @child = @post.replies.create(attributes_for(:reply_post))
    end

    it "is a reply to another post" do 
      expect(@post.replies.first).to eq @child
    end

    it "knows it is a reply" do 
      expect(@child.reply?).to eq true
    end

    it "has a link to its parent" do 
      expect(@child.parent).to eq @post
    end

    it "knows its parents tweet id" do 
      @post.tweet.stub(:twitter_id) { 1 }
      expect(@child.parent_tweet_id).to eq 1
    end
  end

  context "incorrect reply" do 
    before :each do 
      @child = @post.replies.build(attributes_for(:incorrect_reply))
    end

    it "does not get saved" do 
      expect{ @child.save }.to_not change { Post.count }
    end

    it "does not validate" do 
      @child.save
      expect(@child).to have(1).error_on(:content)
    end
  end
end
