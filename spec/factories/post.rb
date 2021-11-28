FactoryBot.define do
  factory :post do
    content { "わーい" }
    association :user
  end
end
