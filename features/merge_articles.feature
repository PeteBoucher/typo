Feature: Merge Articles
  As an Admin
  In order to reduce duplicate content on the blog
  I want to easily merge 2 similar Articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: form input visible on edit page
    Given I am on the edit page for article id "1"
    Then I should see "Merge Articles"