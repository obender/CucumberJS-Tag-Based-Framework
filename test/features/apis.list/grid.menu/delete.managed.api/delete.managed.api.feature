Feature: Delete Managed API - from the kebab options in "Delete Managed API" view
    As a user
    I want to be able to Delete a Managed API

    Pre-requisite:  1 Inactive api in api-list

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in


    Scenario: init) Add 1 inactive API and refresh the api.list section
        Given Postman collection "create.1.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows

    Scenario: Attempt to delete, then cancel
        And  the grid "All Services" has many rows
        And  the value of Tag "~grid:cell|1;;Status" is not ""
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Delete Managed API"
        Then Tag "~confirm:button|Cancel" is clickable
        When I focus on Tag "~confirm:button|Cancel" and I Click Tag "~confirm:button|Cancel"
        Then the value of Tag "~grid:cell|1;;Status" is not ""


    Scenario: Attempt to delete, then really delete
        Given the grid "All Services" has many rows
        And  the value of Tag "~grid:cell|1;;Status" is not ""
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Delete Managed API"
        Then Tag "~confirm:button|Delete" is clickable
        When I focus on Tag "~confirm:button|Delete" and I Click Tag "~confirm:button|Delete"
        Then the value of Tag "~grid:cell|1;;Status" is ""
