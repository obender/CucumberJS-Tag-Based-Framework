Feature: View Service Details - from the kebab options in "View Service Details" view
    As a user
    I want to be able to view the specific API Details (for a service)

    Pre-requisite:  16 services are in api-list


    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable


    Scenario: init) Add 16 services and refresh the api.list section
        Given Postman collection "load.16.services" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: 1)Filtering by Available Services
        Then the grid "All Services" has any rows
        And option "all" in Tag "Filter" is selected
        When I select option "Available Services" in Tag "Filter"
        Then the grid "Available Services" has 16 rows


    Scenario: 2)view " View API Details" of inactive Service
        Given the grid "Available Services" has many rows
        And the value of Tag "~grid:cell|1;;Status" is ""
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View Service Details"
        Then the text in Tag "Service Details" does not contain "Active"
        And  the text in Tag "Service Details" does not contain "Inactive"
        And Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|1;;Status" is ""


