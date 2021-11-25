require 'rails_helper'
require 'pry'

RSpec.feature "User", :type => :feature do
  let(:test_user) {create(:user)}
  
  feature "GET users/index" do
    background do
      visit "users"
    end

    scenario "投稿内容が表示されていること" do

      expect(page).to have_css('profile', text: test_user.name)
    end
  end
end