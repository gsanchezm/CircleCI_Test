Then(/^I click on My messages$/) do
  @app = ProfilePage.new
  @app.goto_messages
end

And(/^I open the last message$/) do
  @app = ProfilePage.new
  @app.open_message
  @app.wait(4)
end

When(/^I delete the message$/) do
  @app.delete_message
end

And(/^I click on checkbox$/) do
  @app = ProfilePage.new
  @app.tapuntapcheckbox
  @app.wait(2)
end

And(/^I click on "([^"]*)" device option$/) do |device_option|
  @app.device_option(device_option)
end