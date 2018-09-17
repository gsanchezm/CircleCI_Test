Then(/^I type "([^"]*)" on that element$/) do |text|
  @app = MainPage.new
  @app.type_search(text)
end

Then(/^I enter "([^"]*)" as completed$/) do |number|
  @app = ChallengePage.new
  #find_element(id:'edit_answer').send_keys(number)
  @app.enter_completed(number)
end

Then(/^I type my comment "([^"]*)" on the text field$/) do |comment|
  @app.type_comment(comment)
end

Then(/^I Check In$/) do
  @app.check_in
end

Then(/^I type "([^"]*)" on the "([^"]*)" text field$/) do |text, value|
  @app.type_on_element(value, text)
  @app.wait(2)
end

And(/^I should quit from challenge$/) do
  @app = ChallengePage.new
  @app.quit_challenge
end

Then(/^I click on "([^"]*)" coach$/) do |coach_name|
  @app = ChallengePage.new
  @app.click_on_coach(coach_name)
end