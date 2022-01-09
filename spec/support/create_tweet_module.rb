module CreateTweetModule
  def create_tweet
    click_link "つぶやく"
    fill_in "postcontent", with: "アイウエオ"
    click_button "つぶやき投稿"
  end
end
