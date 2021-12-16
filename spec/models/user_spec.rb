require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) { create(:user) }

  it "名前、メールアドレス、パスワードがあれば有効な状態であること" do
    expect(test_user).to be_valid
  end

  it "名前が無ければ無効な状態であること" do
    test_user.name = nil
    test_user.valid?
    expect(test_user.errors[:name]).to include("を入力してください")
  end

  it "メールアドレスが無ければ無効な状態であること" do
    test_user.email = nil
    test_user.valid?
    expect(test_user.errors[:email]).to include("を入力してください")
  end

  it "パスワードが無ければ無効な状態であること" do
    test_user.password = nil
    test_user.valid?
    expect(test_user.errors[:password]).to include("を入力してください")
  end

  it "重複したメールアドレスであれば無効な状態であること" do
    new_user = User.new(
      name: "藤川",
      email: "#{test_user.email}",
      password: 555
    )
    new_user.valid?
    expect(new_user.errors[:email]).to include("はすでに存在します")
  end

  it "重複したパスワードであれば無効な状態であること" do
    new_user = User.new(
      name: "藤川",
      email: "fujikawa@example.com",
      password: test_user.password
    )
    new_user.valid?
    expect(new_user.errors[:password]).to include("はすでに存在します")
  end
end
