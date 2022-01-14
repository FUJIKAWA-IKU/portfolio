require 'rails_helper'

RSpec.feature "User", type: :feature do
  feature "ユーザーの新規登録" do
    let(:test_user) { build(:user) }

    scenario "ユーザーの新規登録をしてUser数が1増えること" do
      expect do
        visit "/users/new"
        fill_in "ユーザー名", with: "#{test_user.name}"
        fill_in "email", with: "#{test_user.email}"
        fill_in "パスワード", with: "#{test_user.password}"
        click_button "ユーザー新規登録"
        expect(page).to have_content "#{test_user.name}"
        expect(page).to have_content "#{test_user.email}"
        expect(page).to have_content "#{test_user.password}"
      end.to change { User.count }.by(1)
    end
  end

  feature "ユーザーの詳細ページ" do
    let(:test_user) { create(:user) }

    background do
      sign_in_as(test_user)
    end

    scenario "ユーザーがユーザー情報を編集できること" do
      expect do
        click_link "編集"
        fill_in "spec_email", with: "update_#{test_user.email}"
        fill_in "spec_password", with: "update_#{test_user.password}"
        click_link "更新する"
        expect(page).to have_content "ユーザー情報を編集しました"
        expect(page).to have_content "update_#{test_user.email}"
        expect(page).to have_content "update_#{test_user.password}"
      end
    end

    scenario "適切な名前が表示されていること" do
      expect(page).to have_selector(".username", text: test_user.name)
    end

    scenario "適切なemailが表示されていること" do
      expect(page).to have_selector(".privacy", text: test_user.email)
    end

    scenario "適切なパスワードが表示されていること" do
      expect(page).to have_selector(".privacy", text: test_user.password)
    end

    scenario "適切な画像が表示されていること" do
      expect(page).to have_selector("img[src$='/user_images/#{test_user.image_name}']")
    end

    scenario "編集のリンク先が正しいこと" do
      click_link "編集"
      expect(current_path).to eq edit_user_path(test_user.id)
    end

    scenario "ユーザー名のリンク先が正しいこと" do
      click_link "運動記録詳細ページへのリンク"
      expect(current_path).to eq "/records/index/#{test_user.id}"
    end
  end
end
