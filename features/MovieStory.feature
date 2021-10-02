Feature: User can manually add movie/edit movie/delete movie

@omniauth_test_success

Scenario: Add a movie
  Given I am on the homepage
  When I follow "Log in with Facebook"
  Then I should see "Successfully authenticated from Facebook account."
  And I should see "Welcome!, John Doe"
  When I go to the Create New Movie page
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on Men In Black page
  And I should see "Men In Black"

Scenario: Edit a movie
  Given I am on the homepage
  When I follow "Log in with Facebook"
  Then I should see "Successfully authenticated from Facebook account."
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
  
Scenario: Delete a movie
  Given I am on the homepage
  When I follow "Log in with Facebook"
  Then I should see "Successfully authenticated from Facebook account."
  And I should see "Welcome!, John Doe"
  When I go to "the show page"
  Then I should see "Delete"
  Then I follow "Delete"
  Then I should be on the RottenPotatoes home page
  And I should see "Movie 'Test' deleted."