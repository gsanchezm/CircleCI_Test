Feature: As Hubbub User, I want to login successfully in hubbub application

  Background:
    Given I am on hubbub app

  @demo
  Scenario: Validate that all the elements in main window are present
    Then I should see a "Sign up" button
    And I should see Current server

@demo2
  Scenario Outline: Login as hubbub user
    Given I change Current Server to "QA"
    When I click on "Sign in" button
    Then I type "<user>" credentials
    And I click on "Login" button
    And I click on "user" bottom icon
    And I click on "Settings" button
    And I click on "Log out" button
    Then I should select "Yes" option
    And I should logout from site

    Examples:
      | user          |
      | User4         |