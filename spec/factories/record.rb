FactoryBot.define do
  factory :record do
    runday { "2021/11/27" }
    sequence(:distance) { |n| "#{n}" }
    sequence(:time) { |n| "#{n}" }
    association :user
  end
end
