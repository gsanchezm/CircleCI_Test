When(/^I type "([^"]*)" as company code$/) do |company_code|
  @app = CompanyPage.new
  @app.enter_company_code(company_code)
end

Then(/^I disconnect from company$/) do
  @app = CompanyPage.new
  @app.disconnect_from_company
end


And(/^I click on "([^"]*)" reward$/) do |reward_name|
  @app = CompanyPage.new
  @app.click_on_reward(reward_name)
end