And(/^I click on Check In icon in the Mood Checking$/) do
  @app = MainPage.new
  @app.check_in_mood
end

Then(/^I select Mood checkin as "([^"]*)"$/) do |mood|
  @app = CheckInPage.new
  @app.select_mood_checkin(mood)
end

And(/^I click on Check In$/) do
  @app.click_check_in
end

And(/^I should see Thanks for Checked In and go back to main window$/) do
  @app.take_screenshot
end