Feature: Merge Articles
  As an Admin
  In order to reduce duplicate content on the blog
  I want to easily merge 2 similar Articles

  Scenario: form input visible on edit page
    Given I am logged in as admin
    And I am on the edit page for article "Hello World!"
    Then I should see "Merge Articles"