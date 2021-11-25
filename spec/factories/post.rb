FactoryBot.define do

  factory :post do
    sequence(:content) { |n| "わーい#{n}" }
    association :user
  end
end