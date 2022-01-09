require 'rails_helper'

RSpec.feature "Post", type: :feature do
  let(:test_user) { create(:user) }

  background do
    sign_in_as(test_user)
  end

  scenario "ログインできること" do
    expect(page).to have_content "ログインしました"
  end

  scenario "ユーザーが新規投稿して投稿数が１増えること" do
    expect do
      create_tweet
      expect(page).to have_content "投稿を作成しました"
      expect(page).to have_content "#{test_user.name}"
      expect(page).to have_content "アイウエオ"
    end.to change(test_user.posts, :count).by(1)
  end

  # scenario "ユーザーがつぶやきを削除すれば投稿数が１減ること" do
  #   expect do
  #     create_tweet
  #     click_link "編集"
  #     click_button "削除"
  #     expect(page).to have_content "削除しました"
  #   end.to change(test_user.posts, :count).by(-1)
  # end

  scenario "投稿にいいねできる" do
    create_tweet
    find("#spec_nolike").click
    expect(page).to have_selector '#spec_like'
    expect(test_user.likes.count).to eq(1)
  end

  scenario "投稿のいいねを解除できる" do
    create_tweet
    find("#spec_nolike").click
    expect(page).to have_selector '#spec_like'
    expect(test_user.likes.count).to eq(1)
    find("#spec_like").click
    expect(page).to have_selector '#spec_nolike'
    expect(test_user.likes.count).to eq(0)
  end
end
