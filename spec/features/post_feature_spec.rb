require 'rails_helper'
require 'pry'

RSpec.feature "Post", :type => :feature do
  let(:test_user) {create(:user)}
  let(:test_post) {create(:post, user: test_user)}
  

  feature "GET posts/index" do
    background do
      visit "posts/index"
    end

    scenario "投稿内容が表示されていること" do
      expect(page).to have_css("iku", text: test_post.content)
    end
  end
end