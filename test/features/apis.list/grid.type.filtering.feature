Feature: API List filter type
    As a user
    I want to be able to filter api lists based on their types and status
    
    Pre-requisite:  1  Inactive api is in api-list
                    16 services are in api-list

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable


    Scenario: init) Add one inactive API, 16 services and refresh the api.list section
        Given Postman collection "load.16.services" in folder "apis.list" is Executed successfully
        And Postman collection "create.1.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: 1) Filtering by Available Services
        Then the grid "All Services" has any rows
        And option "all" in Tag "Filter" is selected
        When I select option "Available Services" in Tag "Filter"
        Then the grid "Available Services" has 16 rows
        And Tag "~grid:row|*;Status=Inactive" has no rows
        And  Tag "~grid:row|*;Status=Active" has no rows


    Scenario: 2) Filtering by Available Services - check kebab menu
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1"
        Then the text in Tag "~grid:menuText|1" contains "View Service Details"
        And the text in Tag "~grid:menuText|1" contains "Create Managed API"


    Scenario: 3) Filtering by Managed Services
        Then the grid "Available Services" has any rows
        And option "available" in Tag "Filter" is selected
        When I select option "Managed Services" in Tag "Filter"
        Then the grid "Managed Services" has 1 rows
        And  Tag "~grid:row|*;Status=Inactive - Service not available" has any rows


    Scenario: 4) Filtering by All Services
        Then the grid "Managed Services" has any rows
        And option "managed" in Tag "Filter" is selected
        When I select option "All Services" in Tag "Filter"
        Then the grid "All Services" has 17 rows
        And  Tag "~grid:row|*;Status=Inactive - Service not available" has any rows
