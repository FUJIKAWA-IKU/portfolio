require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:test_training) { create(:training) }

  it "日時、距離、時間があれば有効な状態であること" do
    expect(test_training).to be_valid
  end

  it "日時が無ければ無効な状態であること" do
    test_training.trainingday = nil
    expect(test_training).not_to be_valid
  end

  it "距離が無ければ無効な状態であること" do
    test_training.parts = nil
    expect(test_training).not_to be_valid
  end

  it "時間が無ければ無効な状態であること" do
    test_training.time = nil
    expect(test_training).not_to be_valid
  end

  it "ユーザーidが無ければ無効な状態であること" do
    test_training.user_id = nil
    expect(test_training).not_to be_valid
  end
end
