FactoryBot.define do
  factory :training do
    trainingday { "2021/11/27" }
    parts { "足" }
    sequence(:time) { |n| "#{n}" }
    association :user
  end
end
