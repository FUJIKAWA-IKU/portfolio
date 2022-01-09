require 'rails_helper'
require 'pry'

RSpec.describe "Sessions", type: :request do
  describe "GET users/:id" do
    let!(:test_user) { create(:user) }
    let!(:test_post) { create(:post, user: test_user) }

    before do
      sign_in_request_as(test_user)
    end

    it "つぶやき一覧ページのリクエストが成功していること" do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it "つぶやきの内容を取得していること" do
      get posts_path
      expect(response.body).to include test_post.content
    end

    it "つぶやきに紐づいたユーザー名を取得していること" do
      get posts_path
      expect(response.body).to include test_post.user.name
    end

    it "つぶやき編集ページのリクエストが成功していること" do
      get edit_post_path(test_post.id)
      expect(response).to have_http_status(200)
    end

    it "つぶやき新規投稿ページのリクエストが成功していること" do
      get new_post_path
      expect(response).to have_http_status(200)
    end
  end
end
