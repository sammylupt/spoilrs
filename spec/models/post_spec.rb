require 'spec_helper'

describe Post do

  before :each do 
    @u = FactoryGirl.create(:user)
    @p = FactoryGirl.attributes_for(:post)
    @u.posts.create(@p)
  end
  #binding.pry
  #pending "add some examples to (or delete) #{__FILE__}"

  it "belongs to a user" do 
    expect(@u.posts.count).to eq 1
  end

  it "can be a reply to another post" do 
    post = @u.posts.first
    reply_hash = FactoryGirl.attributes_for(:reply_post)
    new_post = @u.posts.create(reply_hash)

    expect(post.replies.first).to eq new_post
  end

end
