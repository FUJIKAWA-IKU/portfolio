FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "tester#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    sequence(:password) { |n| "#{n}" }
    image_name            {"#{name}.jpg"}
    
  end
end