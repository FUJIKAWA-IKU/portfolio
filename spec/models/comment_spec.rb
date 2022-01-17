require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:test_comment) { create(:comment) }

  it "ユーザーidとポストidがあれば有効な状態であること" do
    expect(test_comment).to be_valid
  end

  it "ユーザーidが無ければ無効な状態であること" do
    test_comment.user_id = nil
    expect(test_comment).not_to be_valid
  end

  it "ポストidが無ければ無効な状態であること" do
    test_comment.post_id = nil
    expect(test_comment).not_to be_valid
  end

  it "bodyが無ければ無効な状態であること" do
    test_comment.body = nil
    expect(test_comment).not_to be_valid
  end

  it "投稿内容が140文字を超えると無効な状態であること" do
    test_comment.body = "あ" * 141
    expect(test_comment).not_to be_valid
  end
end