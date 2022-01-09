require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET users/:id" do
    let(:test_user) { create(:user) }
    let(:test_record) { create(:record, user: test_user) }
    let(:test_training) { create(:training, user: test_user) }

    before do
      sign_in_request_as(test_user)
    end

    it "ランニング記録ページのリクエストが成功していること" do
      get "/trainings/new"
      expect(response).to have_http_status(200)
    end
  end
end
