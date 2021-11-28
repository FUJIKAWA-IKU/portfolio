require 'rails_helper'

RSpec.feature "Post", type: :feature do
  let(:test_user) { create(:user) }

  background do
    visit "/login"
    fill_in "spec_email", with: "#{test_user.email}"
    fill_in "spec_password", with: "#{test_user.password}"
    click_button "ログイン"
  end

  scenario "ログインできること" do
    expect(page).to have_content "ログインしました"
  end

  scenario "ユーザーが新規投稿して投稿数が１増えること" do
    expect do
      click_link "新規"
      fill_in "postcontent", with: "アイウエオ"
      click_button "新規投稿"
      expect(page).to have_content "投稿を作成しました"
      expect(page).to have_content "#{test_user.name}"
      expect(page).to have_content "アイウエオ"
    end.to change(test_user.posts, :count).by(1)
  end

  scenario "投稿にいいねできる" do
    click_link "新規"
    fill_in "postcontent", with: "アイウエオ"
    click_button "新規投稿"
    find("#spec_nolike").click
    expect(page).to have_selector '#spec_like'
    expect(test_user.likes.count).to eq(1)
    find("#spec_like").click
    expect(page).to have_selector '#spec_nolike'
    expect(test_user.likes.count).to eq(0)
  end
end
