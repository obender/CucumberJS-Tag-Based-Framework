Feature: Search the IP Filter grid in Policies page

    Background: Open the "Policies" page
        Given I am logged in

    Scenario: Search "Any" in the grid
        And Postman collection "search.policies" in folder "search" is Executed successfully 1 time
        And Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        And I set Tag "~grid:search" to "Any"
        And I press the "Enter" key
        Then the grid "ipFiltering" has 1 row

    Scenario: Search not existing text in the grid
        And I set Tag "~grid:search" to "Should Not Be Found In Search"
        And I press the "Enter" key
        Then the grid "ipFiltering" has no rows

    Scenario: Add new filter and search it by description in the grid
        When I set Tag "~grid:search" to ""
        And I set Tag "description" to "Allow 4-8"
        And I set Tag "~ipv4:toIp|1" to "5"
        And I set Tag "~ipv4:toIp|2" to "6"
        And I set Tag "~ipv4:toIp|3" to "7"
        And I set Tag "~ipv4:toIp|4" to "8"
        And I set Tag "~ipv4:fromIp|4" to "4"
        And I click Tag "Add"
        And I set Tag "~grid:search" to "Allow 4-8"
        And I press the "Enter" key
        Then the grid "ipFiltering" has 1 row

    Scenario: Search "Allow" in the grid
        When I focus on Tag "Policies" and I Click Tag "Policies"
        And I set Tag "~grid:search" to ""
        And I press the "Enter" key
        And I set Tag "description" to "Allow 9-12"
        And I set Tag "~ipv4:toIp|1" to "5"
        And I set Tag "~ipv4:toIp|2" to "6"
        And I set Tag "~ipv4:toIp|3" to "7"
        And I set Tag "~ipv4:toIp|4" to "12"
        And I set Tag "~ipv4:fromIp|4" to "9"
        And I click Tag "Add"
        And I set Tag "~grid:search" to "Allow"
        And I press the "Enter" key
        Then the grid "ipFiltering" has 3 row
