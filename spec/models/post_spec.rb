require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:test_post) { create(:post) }

  it "投稿内容、ユーザーidがあれば有効な状態であること" do
    expect(test_post).to be_valid
  end

  it "投稿内容が無ければ無効な状態であること" do
    test_post.content = nil
    test_post.valid?
    expect(test_post.errors[:content]).to include("を入力してください")
  end

  it "ユーザーidが無ければ無効な状態であること" do
    test_post.user_id = nil
    expect(test_post).not_to be_valid
  end

  it "投稿内容が140文字を超えると無効な状態であること" do
    test_post.content = "あ" * 141
    expect(test_post).not_to be_valid
  end
end
