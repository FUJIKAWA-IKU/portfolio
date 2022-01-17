require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:test_relationship) { create(:relationship) }

  it "ユーザーidとポストidがあれば有効な状態であること" do
    expect(test_like).to be_valid
  end

  it "ユーザーidが無ければ無効な状態であること" do
    test_like.user_id = nil
    expect(test_like).not_to be_valid
  end

  it "ポストidが無ければ無効な状態であること" do
    test_like.post_id = nil
    expect(test_like).not_to be_valid
  end
end
