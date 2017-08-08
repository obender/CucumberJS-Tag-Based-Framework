

Feature: Policies - rate limit policy

    prerequisite: postman collection for rate limit with default values is loaded

    Background: Open the "login" page
        Given I am logged in

    Scenario: Make sure that the relevant tags are desplayed
        Given Postman collection "policies.rateLimit" in folder "policies" is Executed successfully 1 time
        When I focus on Tag "Policies" and I click Tag "Policies"
        Then Tags "Allow|requests, every" are displayed
        And the grid "ipFiltering" has any rows

    Scenario: Error messege
        When I set Tag "Allow" to "-1111"
        Then the value of Tag "~error:validation|Allow" is "Enter a positive integer"

    Scenario: Error messege
        When I set Tag "requests, every" to "555"
        Then the value of Tag "~error:validation|requests, every" contains "Minimum time is"

    Scenario: Error messege
        When I set Tag "requests, every" to "99999999"
        Then the value of Tag "~error:validation|requests, every" contains "Maximum time is"

    Scenario: Error messege
        When I set Tag "Allow" to "9999999"
        Then the value of Tag "~error:validation|Allow" contains "Max. limit is"

    Scenario: set <Allow> to "1111" and set <request, every> to "4444"
        When I set Tag "Allow" to "1111"
        Then the value of Tag "Allow" is "1111"
        When I set Tag "requests, every" to "4444"
        Then the value of Tag "requests, every" is "4444"
        And the value of Tag "~error:validation|Allow" is ""
        And the value of Tag "~error:validation|requests, every" is ""

