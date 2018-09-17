require 'selenium-webdriver'

Given(/^I am on hubbub app$/) do
  @app = LoginPage.new
end

Then /^I should see a text field "([^"]*)"$/ do |txt_field|
  case  txt_field
    when 'First Name'
      @app = RegisterPage.new
      expect(@app.first_name_displayed?(txt_field)).to be true
    when 'Last Name'
      expect(@app.last_name_displayed?(txt_field)).to be true
    when 'Screen Name'
      expect(@app.screen_name_displayed?(txt_field)).to be true
    else
      expect(@app.email_password_displayed?(txt_field)).to be true
  end
end

And /^I should logout from site$/ do
  @app.element_displayed?('Sign in')
end

Then(/^I should see a "([^"]*)" button$/) do |button_text|
  expect(@app.login_buttons_displayed?(button_text)).to be true
end

Then(/^I should see the "([^"]*)" label$/) do |label_text|
  expect(@app.element_displayed?(label_text)).to be true
end

And(/^I should see Current server$/) do
  expect(@app.current_server_displayed?).to be true
end

And(/^I should see the link "([^"]*)"$/) do |link_text|
  expect(@app.element_displayed?(link_text)).to be true
end

And(/^I should see an image carousel$/) do
  expect(@app.image_carousel_displayed?).to be true
end

When(/^I click on "([^"]*)" button$/) do |button_text|
  if button_text.eql?'Continue'
    @app = RegisterPage.new
    @app.click_on_continue
  else
    @app.wait(2)
    @app = LoginPage.new
    @app.click_on_element(button_text)
    @app.wait(2)
  end
end

Given(/^I change Current Server to "([^"]*)"$/) do |server_name|
  expect(@app.change_server).to eql server_name
end

Then(/^I type "([^"]*)" credentials$/) do |user|
  if user.eql? 'random_user'
    @app = SignUpPage.new
    @app.new_user
  else
    @app.login_with(user)
  end
end

Then(/^I should select "([^"]*)" option$/) do |option|
  @app.click_on_element(option)
end

And(/^I click on "([^"]*)" bottom icon$/) do |bottom_icon|
  @app = MainPage.new
  @app.select_icon_bottom(bottom_icon)
end