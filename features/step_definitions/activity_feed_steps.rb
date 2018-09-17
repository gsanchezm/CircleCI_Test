Then(/^I should see activity feed us correctly loaded$/) do
  expect(@app.get_all_activity_challenges != 0). to be true
end

And(/^I click on "([^"]*)" icon$/) do |icon|
  case icon.downcase
    when 'fistbump'
      @app.select_fist_bump
      else
        @app.click_on_element(icon)
  end
end

And(/^I click on "([^"]*)" challenge$/) do |challenge|
  @app = MainPage.new
  @app.click_on_challenge(challenge)
end

Then(/^I click on "([^"]*)" tab$/) do |tab|
  @app = ChallengePage.new
  @app.challenge_tab(tab)
  @app.wait(2)
end

And(/^I click on "([^"]*)" icon inside my challenge$/) do |icon|
  case icon.downcase
  when 'fistbump'
    @app.select_fist_bump_challenge
  end
end


And(/^I select the Comment icon$/) do
  @app.select_comment
end