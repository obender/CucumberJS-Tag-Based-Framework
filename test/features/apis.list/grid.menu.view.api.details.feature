Feature: View API Details - from the kebab options in "View API Details" view
    As a user
    I want to be able to view the specific API Details (for an API)

    Pre-requisite:  1 Inactive api in api-list

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable


    Scenario: init) Add 1 inactive API, 16 services and refresh the api.list section
        Given Postman collection "load.16.services" in folder "apis.list" is Executed successfully
        And  Postman collection "create.1.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: view " View API Details" of inactive API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the text in Tag "Managed API Details" contains "Inactive - Service not available"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"


    Scenario: 1) Activate, Inactive API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        And  the value of Tag "~grid:row|1" contains "inactive_1"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Activate"
        Then the value of Tag "~grid:cell|1;;Status" is "Active - Service not available"


    # Scenario: 2) View " View API Details" of active API
    #     Given the grid "All Services" has many rows
    #     And the value of Tag "~grid:cell|1;;Status" is "Active - Service not available"
    #     When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
    #     Then the text in Tag "Managed API Details" contains "Active - Service not available"
    #     And  Tag "~confirm:button|Close" is clickable
    #     When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
    #     Then the value of Tag "~grid:cell|1;;Status" is "Active - Service not available"


    # Scenario: 3) Deactivate, Active API
    #     Given the grid "All Services" has many rows
    #     And the value of Tag "~grid:cell|1;;Status" is "Active - Service not available"
    #     And  the value of Tag "~grid:row|1" contains "inactive_1"
    #     When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Deactivate"
    #     Then the grid "All Services" has many rows
    #     And the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"


    Scenario: 4) Filtering by Available Services
        Then the grid "All Services" has any rows
        And option "all" in Tag "Filter" is selected
        When I select option "Available Services" in Tag "Filter"
        Then the grid "Available Services" has 16 rows

    # TODO: Fix the cemented issues bugs at Symphony
    # Bug : https://infajira.informatica.com/projects/SYM/issues/SYM-1028
    # Scenario: 5) View " View API Details" of active API
    #     Given the grid "Available Services" has many rows
    #     And the value of Tag "~grid:cell|1;;Name" is "Employee1A"
    #     And the value of Tag "~grid:cell|1;;Status" is ""
    #     When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Create Managed API"
    #     Then the grid "Available Services" has 15 rows
    #     And option "available" in Tag "Filter" is selected
    #     Then I select option "Managed Services" in Tag "Filter"


    # Scenario: 6) View " View API Details" of active API (formerly a Service)
    #     Given the grid "Managed Services" has any rows
    #     When  I set Tag "~grid:search" to "Employee1A"
    #     And  I press the "Enter" key
    #     Then the value of Tag "~grid:cell|1;;Status" is "Active"
    #     When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
    #     Then the text in Tag "Managed API Details" contains "Active"
    #     And  Tag "~confirm:button|Close" is clickable
    #     When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
    #     Then the value of Tag "~grid:cell|1;;Status" is "Active"

    # Scenario: 7) Deactivate - Active API
    #     Given the grid "Managed Services" has any rows
    #     And the value of Tag "~grid:cell|1;;Name" is "Employee1A"
    #     And the value of Tag "~grid:cell|1;;Status" is "Active"
    #     When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Deactivate"
    #     And the value of Tag "~grid:cell|1;;Status" is "Inactive"

    # Scenario: 8) Check "View API Details" - Inactive
    #     Given the grid "Managed Services" has any rows
    #     And the value of Tag "~grid:cell|1;;Name" is "Employee1A"
    #     And the value of Tag "~grid:cell|1;;Status" is "Inactive"
    #     When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
    #     Then the text in Tag "Managed API Details" contains "Inactive"
    #     And  Tag "~confirm:button|Close" is clickable
    #     When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
    #     Then the value of Tag "~grid:cell|1;;Status" is "Inactive"

    # Scenario: 9) Delete inactive API
    #     Given the grid "Managed Services" has any rows
    #     And the value of Tag "~grid:cell|1;;Name" is "Employee1A"
    #     And the value of Tag "~grid:cell|1;;Status" is "Inactive"
    #     When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Delete Managed API"
    #     And Tag "~confirm:button|Delete" is clickable
    #     Then I focus on Tag "~confirm:button|Delete" and I Click Tag "~confirm:button|Delete"


    Scenario: 10) Clear the search window and Available Services is now in it's initial state (16 services)
        When  I select option "Available Services" in Tag "Filter"
        Then  the grid "Available Services" has any rows
        When  I set Tag "~grid:search" to ""
        And  I press the "Enter" key
        Then  the grid "Available Services" has 16 rows
