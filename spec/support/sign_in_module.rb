module SignInModule
  def sign_in_as(test_user)
    visit "/login"
    fill_in "spec_email", with: "#{test_user.email}"
    fill_in "spec_password", with: "#{test_user.password}"
    click_button "ログイン"
  end
end
