FactoryBot.define do
  factory :post do
    content { "γγΌγ" }
    association :user
  end
end
