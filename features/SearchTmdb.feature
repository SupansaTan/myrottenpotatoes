Feature: User can search movie Tmdb

    Scenario: Search movie
        Given I am on the RottenPotatoes home page
        Then I should see "RottenPotatoes"
        And I should see "Search movie in TMDb"
        When I fill in "search_terms" with "aladin"
        And I press "Search"
        Then I should be on the Search TMDb page
        And I should see "Search Results"
        
