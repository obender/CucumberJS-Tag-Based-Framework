
Feature: Policies - IP filtering

    prerequisite: no rules are set for the organization

    Background: Log in and open the policies pub
        Given I am logged in

    Scenario: check that the grid header's column names are displayed as expected
        Given Postman collection "policies.ipFiltering.view" in folder "policies" is Executed successfully 1 time
        When I focus on Tag "Policies" and I click Tag "Policies"
        Then Tags "fromIp|toIp|description|description|Update|Cancel|Add|ipFiltering|accessType" are displayed
        And Tag "~grid:validateColumns|Access Type;From IP Address;To IP Address;Description" is displayed

    Scenario: Verify the first line is displayed
        Given the grid "ipFiltering" has any rows
        Then the grid "ipFiltering" has 1 row
        And Tag "~grid:row|1;3" is displayed
        And the value of Tag "~grid:row|1" is "Allow|Any|Any"
        And the value of Tag "~grid:cell|1;;Access Type" is "Allow"
        And the value of Tag "~grid:cell|1;;To IP Address" is "Any"





