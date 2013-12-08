require 'spec_helper'

describe Post do

  before :each do 
    @u = FactoryGirl.create(:user)
    p = FactoryGirl.attributes_for(:post)
    @u.posts.create(p)
    @post = @u.posts.first
  end

  it "belongs to a user" do 
    expect(@u.posts.count).to eq 1
  end

  it "creates a tweet when it is posted" do 
    expect(@post.tweet).to be_a Tweet
  end

  context "replies" do 
    before :each do 
      @post = @u.posts.first
      reply_hash = FactoryGirl.attributes_for(:reply_post)
      @new_post = @u.posts.create(reply_hash)
    end
  end

  it "can be a reply to another post" do 
    expect(@post.replies.first).to eq @new_post
  end

  it "knows that it is a reply" do 
    expect(@new_post.reply?).to eq true
  end

end
