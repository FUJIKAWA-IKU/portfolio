require 'rails_helper'

RSpec.feature "User", type: :feature do
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
