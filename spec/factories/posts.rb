# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    content { Faker::Lorem.sentence(10) }
    secret { Faker::Lorem.sentence(10) }
  
    factory :reply_post do 
      post_id 1
    end
  end
end
