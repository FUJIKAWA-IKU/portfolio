require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET users" do
    let(:test_user) { create(:user) }
    let(:test_post) { create(:post, user: test_user) }

    before do
      sign_in_request_as(test_user)
      test_post
      get user_path(test_user.id)
    end

    it "ユーザー詳細ページのリクエストが成功していること" do
      expect(response).to have_http_status(200)
    end

    it "ユーザー名を取得していること" do
      expect(response.body).to include test_user.name
    end

    it "ユーザーのemailを取得していること" do
      expect(response.body).to include test_user.email
    end

    it "ユーザーのパスワードを取得していること" do
      expect(response.body).to include test_user.password
    end

    it "ユーザーに紐づいたつぶやきの内容を取得していること" do
      expect(response.body).to include test_user.posts.first.content
    end
  end

  describe "GET posts" do
    let(:test_user) { create(:user) }

    before do
      sign_in_request_as(test_user)
    end

    it "ユーザー編集ページのリクエストが成功していること" do
      get edit_user_path(test_user.id)
      expect(response).to have_http_status(200)
    end
  end
end
