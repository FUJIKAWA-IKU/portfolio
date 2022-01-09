module SignInRequestModule
  def sign_in_request_as(test_user)
    session_params = { user: { email: test_user.email, password: test_user.password } }
    post "/login", params: session_params
  end
end
