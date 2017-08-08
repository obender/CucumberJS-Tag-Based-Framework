Feature: copy managed url - from the kebab options in "Managed Services" view
    As a user
    I want to be able to copy API Managed URL value to clipboard.


    Pre-requisite:  1 Inactive api in api-list

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable

    Scenario: init) Add 1 inactive API and refresh the api.list section
        Given Postman collection "create.1.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows

    Scenario: 1) Test that the Kebab menu of the service has no Copy Managed URL option
        When I select option "Available Services" in Tag "Filter"
        Then the grid "Available Services" has any rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1"
        Then the text in Tag "~grid:menuText|1" is not "Copy Managed URL"


    Scenario: 2) Test that the Kebab menu of the "managed services" has "Copy Managed URL" option
        When I do Refresh
        And the grid "All Services" has any rows
        And  I select option "Managed Services" in Tag "Filter"
        Then the grid "Managed Services" has any rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1"
        Then the text in Tag "~grid:menuText|1" contains "Copy Managed URL"


    Scenario: 2) click "Copy Managed URL" option from the kebab menu in the "Managed Services" view
        When I select option "Managed Services" in Tag "Filter"
        Then the grid "Managed Services" has any rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Copy Managed URL"





