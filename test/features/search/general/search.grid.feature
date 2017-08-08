Feature: Search the API Management grid

    Background: Open the "Explore" page
        Given I am logged in

    Scenario: Execute Preparation postman
        When Postman collection "search.grid" in folder "search" is Executed successfully 1 time

    Scenario: Search a non-existing value in the api-list grid
        When I set Tag "~grid:search" to "not exist"
        And I press the "Enter" key
        Then the grid "api-list" has no rows


    Scenario: Search a long string in the api-list grid
        When I set Tag "~grid:search" to "INFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFAINFA"
        And I press the "Enter" key
        Then the grid "api-list" has no rows


    Scenario: Search a Hebrew value in the api-list grid
        When I set Tag "~grid:search" to "עברית"
        And I press the "Enter" key
        Then the grid "api-list" has no rows


    Scenario: Search special characters in the api-list grid
        When I set Tag "~grid:search" to "<$%.,#"
        And I press the "Enter" key
        Then the grid "api-list" has no rows

    Scenario: Search text after filtering by Available Services
        When I select option "Available Services" in Tag "Filter"
        And I set Tag "~grid:search" to ""
        And I press the "Enter" key
        When I set Tag "~grid:search" to "rest"
        And I press the "Enter" key
        Then the grid "api-list" has 8 row


    Scenario: Search text after filtering by All Services
        When I select option "All Services" in Tag "Filter"
        And I set Tag "~grid:search" to ""
        And I press the "Enter" key
        When I set Tag "~grid:search" to "3A"
        And I press the "Enter" key
        Then the grid "api-list" has 2 row
