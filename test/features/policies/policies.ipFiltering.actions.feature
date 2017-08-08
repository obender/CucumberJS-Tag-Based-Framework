
Feature: Policies - IP filtering Acttions

    prerequisite: no rules are set for the organization

    Background: Log in and open the policies pub
        Given I am logged in

    Scenario: Sanity just to check that all the tags are here
        Given Postman collection "policies.ipFiltering.actions" in folder "policies" is Executed successfully 1 time
        When I focus on Tag "Policies" and I click Tag "Policies"
        Then the grid "ipFiltering" has any rows
        And Tags "fromIp|toIp|description|Update|Cancel|Add|ipFiltering|accessType" are displayed
        And Tag "~grid:validateColumns|Access Type;From IP Address;To IP Address;Description" is displayed
        And option "Allow" in Tag "accessType" is selected

    Scenario: error message for partial IP
        When  I set Tag "~ipv4:fromIp|1" to "1"
        Then the value of Tag "~ipv4:fromIp|error" is "Enter a valid IP address"

        When  I set Tag "~ipv4:fromIp|2" to "2"
        Then the value of Tag "~ipv4:fromIp|error" is "Enter a valid IP address"

        When  I set Tag "~ipv4:fromIp|3" to "3"
        Then the value of Tag "~ipv4:fromIp|error" is "Enter a valid IP address"

        When  I set Tag "~ipv4:fromIp|4" to "4"
        Then there is no error in Tag "~ipv4:fromIp|error"

        When I set Tag "~ipv4:toIp|1" to "5"
        And  I set Tag "~ipv4:toIp|2" to "6"
        And  I set Tag "~ipv4:toIp|3" to "7"
        Then the value of Tag "~ipv4:toIp|error" is "Enter a valid IP address"

        When  I set Tag "~ipv4:toIp|4" to "1"
        Then the value of Tag "~ipv4:toIp|error" is "Enter a valid IP range"

        When  I set Tag "~ipv4:toIp|4" to "8"
        Then there is no error in Tag "~ipv4:toIp|error"

    Scenario: fill in description and add this rule
        Given the grid "ipFiltering" has 1 row
        When I set Tag "description" to "Allow 4-8"
        Then Tag "Add" is clickable
        When I click Tag "Add"
        Then the grid "ipFiltering" has 2 rows
        And the value of Tag "~grid:row|1" is "Allow|5.6.7.4|5.6.7.8|Allow 4-8"
        And the value of Tag "~grid:row|2" is "Allow|Any|Any"
        And the value of Tag "description" is ""
        And the value of Tag "~ipv4:fromIp|1" is ""
        And the value of Tag "~ipv4:fromIp|2" is ""
        And the value of Tag "~ipv4:fromIp|3" is ""
        And the value of Tag "~ipv4:fromIp|4" is ""
        And the value of Tag "~ipv4:toIp|1" is ""
        And the value of Tag "~ipv4:toIp|2" is ""
        And the value of Tag "~ipv4:toIp|3" is ""
        And the value of Tag "~ipv4:toIp|4" is ""
        And there is no error in Tag "~ipv4:fromIp|error"
        And there is no error in Tag "~ipv4:toIp|error"

    Scenario: try to add multiple rule
        When I set Tag "~ipv4:fromIp|1" to "5"
        When I set Tag "~ipv4:fromIp|2" to "6"
        When I set Tag "~ipv4:fromIp|3" to "7"
        When I set Tag "~ipv4:fromIp|4" to "4"
        And  I set Tag "~ipv4:toIp|4" to "8"
        Then the value of Tag "~ipv4:toIp|error" is "Rule for this IP range exist"
        And Tag "Add" is clickable
        When I click Tag "Add"
        Then the grid "ipFiltering" has 2 rows

    Scenario: try to add deny rule
        When I select option "Deny" in Tag "accessType"
        Then option "Deny" in Tag "accessType" is selected
        When I set Tag "~ipv4:fromIp|4" to "3"
        And  I set Tag "~ipv4:toIp|4" to "3"
        And  I set Tag "description" to "Deny 3"
        Then Tag "Add" is clickable
        When I click Tag "Add"
        Then the grid "ipFiltering" has 3 rows
        And the value of Tag "~grid:row|1" is "Deny|5.6.7.3|5.6.7.3|Deny 3"
        And the value of Tag "~grid:row|2" is "Allow|5.6.7.4|5.6.7.8|Allow 4-8"
        And the value of Tag "~grid:row|3" is "Allow|Any|Any"
        And Tag "~grid:row|*;Access Type;Allow" has 2 rows
        And the value of Tag "~grid:row|2;Access Type;Allow" is "Allow|Any|Any"
        And option "Allow" in Tag "accessType" is selected


    Scenario: Move an ip filtering rule down
        Given the grid "ipFiltering" has 3 rows
        Then Tag "~grid:row|1" is clickable
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Move Down"
        Then the value of Tag "~grid:row|1" is "Allow|5.6.7.4|5.6.7.8|Allow 4-8"
        And the value of Tag "~grid:row|2" is "Deny|5.6.7.3|5.6.7.3|Deny 3"


    Scenario: Move an ip filtering rule up
        Given the grid "ipFiltering" has 3 rows
        Then Tag "~grid:row|2" is clickable
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "Move Up"
        Then the value of Tag "~grid:row|1" is "Deny|5.6.7.3|5.6.7.3|Deny 3"
        And  the value of Tag "~grid:row|2" is "Allow|5.6.7.4|5.6.7.8|Allow 4-8"


    Scenario: Delete an ip filtering rule
        Given the grid "ipFiltering" has 3 rows
        Then Tag "~grid:row|1" is clickable
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Delete"
        Then the grid "ipFiltering" has 2 rows


    Scenario: try to click cancel
        Given Tag "Cancel" is clickable
        When I click Tag "Cancel"
        Then the grid "ipFiltering" has 1 rows
        And the value of Tag "~grid:row|1" is "Allow|Any|Any"
