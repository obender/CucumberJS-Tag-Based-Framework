Feature: API List grid functionality
    As a user
    I want to be able to get visual indication about managed APIs having no associated ICRT service.


    Pre-requisite:  1 Inactive api in api-list

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And   Tag "Explore" is clickable


    Scenario: init) Add 1 inactive API and refresh the api.list section
        Given Postman collection "create.1.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: 1) Test that the status of the Active API, having no associated ICRT service, is shown as 'Active - Service not available
        When Tag "~grid:validateColumns|Name;Type;Status;Authentication;Description" is displayed
        And  the grid "api-list" has any rows
        Then  the value of Tag "~grid:row|1" is "inactive_1|REST|Inactive - Service not available|Anonymous"


    Scenario: 2) Test that Kebab menu of the Active API, having no associated ICRT service,
                        is the same as the menu of Active API with underlying ICRT service:
                            (View API Details, Activate, Copy Managed URL, Delete Managed API)
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1"
        Then the text in Tag "~grid:menuText|1" contains "View API Details"
        And the text in Tag "~grid:menuText|1" contains "Activate"
        And the text in Tag "~grid:menuText|1" contains "Copy Managed URL"
        And the text in Tag "~grid:menuText|1" contains "Delete Managed API"


    Scenario: 3)Test that the row showing the Active API having no associated ICRT service is grayed out
        When the grid "api-list" has any rows
        Then Tag "~grid:cell|1;1;1" is grayed out
