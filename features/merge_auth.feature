Feature: Merge Articles
  As an Admin
  In order to reduce duplicate content on the blog
  I want to easily merge 2 similar Articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel as publisher

  Scenario: non-admin should not see merge feature on edit page
    Given that the user "pete" has authored the article "Test"
    And I am on the edit page for article "Test"
    Then I should not see "Merge Articles"