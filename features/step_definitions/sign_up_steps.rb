When(/^I click on "([^"]*)" checkbox$/) do |age|
  if age.eql?'Age'
    @app = SignUpPage.new
    @app.click_on_age_checkbox
  end
end

Then(/^I type  "([^"]*)"$/) do |txt_field|
  @app = RegisterPage.new
  if txt_field.eql?'First, Last and Screen Name'
    @app.type_first_last_screen
  elsif txt_field.eql? 'Employee ID'
    @app.employee_id
  else
    @app.company_code
  end
end

Then(/^I should select "([^"]*)" from "([^"]*)"$/) do |option, value|
  @app.select_from_spinner(value,option)
end

Then(/^I select "([^"]*)" from list$/) do |year|
  @app = RegisterPage.new
  @app.select_from_list(year)
end

Then(/^I select "([^"]*)" as day of birth$/) do |day|
  @app.day_picker(day)
end

Then(/^I type "([^"]*)" as weight \(lbs\)$/) do |weight|
  @app.type_weight(weight)
end

Then(/^I tap on Weight field$/) do
  @app.tap(654.5,1044.5,1)
end

When(/^I type "([^"]*)" as weight$/) do |weight|
  @app = RegisterPage.new
  @app.type_weight(weight)
end

Then(/^I select "([^"]*)" "([^"]*)" as height$/) do |ft, inch|
  @app.select_height(ft, inch)
end

Then(/^I answer Hubbub360 Questionnaire$/) do
  @app.hubbub360
end