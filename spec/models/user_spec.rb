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

    it "is created by omniauth" do 
      user = User.find_or_create_by_omniauth(omniauth_hash)
      expect(User.first).to eq user
    end
  end

end
