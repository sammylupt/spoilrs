# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    content { "My content" }
    secret { "My secret" }
  
    factory :reply_post do 
      content "@nickname My reply"
      post_id 1
    end

    factory :incorrect_reply do 
      content "does not start with @nickname"
      post_id 1
    end
  end
end
