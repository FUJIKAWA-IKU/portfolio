require 'rails_helper'

RSpec.feature "Record", type: :feature do
  let(:test_user) { create(:user) }

  background do
    sign_in_as(test_user)
  end

  scenario "ランニングの記録ができる" do
    find("#spec_record").click
    fill_in "spec_distance", with: "10"
    fill_in "spec_time", with: "30"
    click_button "記録する"
    expect(page).to have_content "記録しました"
  end
end
