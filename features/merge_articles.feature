Feature: Merge Articles
  As an Admin
  In order to reduce duplicate content on the blog
  I want to easily merge 2 similar Articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: form input visible on edit page
    Given that the user "admin" has authored the article "Test"
    And that the user "pete" has authored the article "My post"
    And I am on the edit page for article "Test"
    Then I should see "Merge Articles"
    Then I press "merge"

  Scenario: form input not visible on new article view
    Given I am on the edit page for a new article
    Then I should not see "Merge Articles"