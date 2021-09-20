Feature: User can manually add movie/edit movie

Scenario: Add a movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on Men In Black page
  And I should see "Men In Black"

Scenario: Edit a movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on Men In Black page
  And I should see "Men In Black"
  Then I follow "Edit info"
  And I should be on the Edit Movie page
  When I fill in "Title" with "Men In Black2"
  And I select "PG-13" from "Rating"
  And I press "Update Movie Info"
  Then I should be on Men In Black 2 page
  And I should see "Men In Black2"