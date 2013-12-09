require 'spec_helper'

describe User do

  let(:omniauth_hash) { 

    {
      "credentials" => {
        "token" => "Test Token",
        "secret" => "Test Secret"
      },
      "uid" => 100,
      "info" => {
        "name" => "Test Name",
        "nickname" => "Test Nickname"
      }
    }
  }

  context "find or create by omniauth" do 

    before :each do 
      @user = User.find_or_create_by_omniauth(omniauth_hash)
    end

    it "creates one user via omniauth" do 
      expect(User.first).to eq @user
      expect(User.count).to eq 1
    end

    context "finding users" do 
      before :each do 
        @user_call = User.find_or_create_by_omniauth(omniauth_hash)
      end

      it "finds users who already exist" do 
        expect(@user).to eq @user_call
      end

      it "does not create a new user" do 
        expect(User.count).to eq 1
      end
    end
  end
end
