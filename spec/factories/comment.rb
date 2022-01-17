FactoryBot.define do
  factory :comment do
    body {"コメント投稿"}
    association :post
    user { post.user }
  end
end