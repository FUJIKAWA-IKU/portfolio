require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:test_record) { create(:record) }

  it "日時、距離、時間があれば有効な状態であること" do
    expect(test_record).to be_valid
  end

  it "日時が無ければ無効な状態であること" do
    test_record.runday = nil
    expect(test_record).not_to be_valid
  end

  it "距離が無ければ無効な状態であること" do
    test_record.distance = nil
    expect(test_record).not_to be_valid
  end

  it "時間が無ければ無効な状態であること" do
    test_record.time = nil
    expect(test_record).not_to be_valid
  end

  it "ユーザーidが無ければ無効な状態であること" do
    test_record.user_id = nil
    expect(test_record).not_to be_valid
  end

  it "走行距離において100kmを超えると無効な状態であること" do
    test_record.distance = 100.1
    expect(test_record).not_to be_valid
  end

  it "走行時間において600分を超えると無効な状態であること" do
    test_record.time = 601
    expect(test_record).not_to be_valid
  end
end
