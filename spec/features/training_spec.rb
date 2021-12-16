require 'rails_helper'

RSpec.feature "Training", type: :feature do
  let(:test_user) { create(:user) }

  background do
    visit "/login"
    fill_in "spec_email", with: "#{test_user.email}"
    fill_in "spec_password", with: "#{test_user.password}"
    click_button "ログイン"
  end

  scenario "筋トレの記録ができる" do
    find("#spec_training").click
    find("#spec_parts").find("option[value='足']").select_option
    fill_in "spec_time", with: "30"
    click_button "記録する"
    expect(page).to have_content "記録しました"
  end
end
