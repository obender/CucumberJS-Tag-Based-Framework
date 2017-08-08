Feature: Policies - IP filtering Acttions

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable

    Scenario: Deactivate Managed API (using kebab)
        Given the grid "All Services" has any rows

    Scenario: fill in description and add this rule
        When I focus on Tag "Policies" and I click Tag "Policies"
        Then the grid "ipFiltering" has any rows
        When I click Tag "Update"
        Then Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then Tag "Policies" is clickable




