Feature: User can search movie Tmdb

    Scenario: Search movie
        Given I am on the RottenPotatoes home page
        Then I should see "Rotten Potatoes"
        When I fill in "search_terms" with "aladin"
        When I press "fa-search"
        Then I should be on the Search TMDb page
        And I should see "Search Result for 'aladin'"
        
