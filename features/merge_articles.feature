Feature: Merge Articles
  As an Admin
  In order to reduce duplicate content on the blog
  I want to easily merge 2 similar Articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    Given that the user "admin" has authored the article "Test"
    And that the user "pete" has authored the article "My post"
    And that the article "Test" has body "This is my fantaboulus test."
    And that the article "My post" has body "This is my awesome post."
    And I am on the edit page for article "Test"
    And I fill in "merge_with" with "4"
    When I press "Merge"

  Scenario: form input visible on edit page
    Then show me the page
    Then I should see "Merge Articles"

  Scenario: form input not visible on new article view
    Given I am on the edit page for a new article
    Then I should not see "Merge Articles"

  Scenario: merged article should contain the text of both previous articles.
    Then the article "Test" should contain "my fantaboulus test"
    And the article "Test" should contain "my awesome post"

  Scenario: merged article should have one author (either one of the authors of the original article).
    Then the author of article "Test" should be "admin"
    And the author of article "Test" should not be "pete"

  Scenario: title of the new article should be the title from either one of the merged articles.


