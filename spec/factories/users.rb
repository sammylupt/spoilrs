require 'faker'
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    screen_name { "nickname" }
    tid { rand(0.1000) }
    token ENV['SCOTT_TOKEN']
    secret ENV['SCOTT_SECRET']
  end
end
