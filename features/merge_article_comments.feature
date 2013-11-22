Feature: Comments on each of the two original articles need to all carry over and point to the new, merged article.
	As a blog contributor
	In order to persist my feedback
	I want to see my original comments on a merged article

	Background:
		Given the blog is set up
    And I am logged into the admin panel
		Given that the user "admin" has authored the article "Test"
		And that the user "pete" has authored the article "My post"
		And that the article "Test" has body "This is my fantaboulus test."
		And that the article "My post" has body "This is my awesome post."
		And that the article "Test" has a comment "It worked!"
		And that the article "My post" has a comment "Truly awesome."
		And I am on the edit page for article "Test"

	Scenario:
		When I fill in "merge_with" with "4"
		And I press "Merge"
		Then the article "My post" should not exist
		And the article "Test" should exist
		Given I am on the page for article "Test"
		Then I should see "It worked!"
		And I should see "Truly awesome."
