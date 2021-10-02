Feature: Login

@omniauth_test_success
Scenario: A user successfully signs in with Facebook
    Given I am on the homepage
    When I follow "Log in with Facebook"
    Then I should see "Successfully authenticated from Facebook account."

@omniauth_test_failure
Scenario: A user unsuccessfully signs in with Facebook
    Given I am on the RottenPotatoes home page
    And I follow "Log in with Facebook"
    Then I should see "Rotten Potatoes"