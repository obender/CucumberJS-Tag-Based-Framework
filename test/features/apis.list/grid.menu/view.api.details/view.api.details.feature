Feature: View API Details - from the kebab options in "View API Details" view
    As a user
    I want to be able to view the specific API Details (for an API)

    Pre-requisite:  3 Inactive api in api-list

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable


    Scenario: init) Add 3 inactive API, 16 services and refresh the api.list section
        Given Postman collection "load.16.services" in folder "apis.list" is Executed successfully
        And  Postman collection "create.3.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: 1) Active API in row 2
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|2;;Status" is "Inactive - Service not available"
        And  the value of Tag "~grid:row|2" contains "inactive_2"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "Activate"
        Then the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"


    Scenario: 2) No tabs in "View Service Details"
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|4;;Status" is ""
        When I focus on Tag "~grid:row|4" and I Click Tag "~grid:menu|4" and I click on text "View Service Details"
        Then the text in Tag "Service Details" does not contain "Status"
        And the text in Tag "Service Details" does not contain "Managed API URL"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|4;;Status" is ""


    Scenario: 3) "General" and "Rate Limit" tabs in "View API Details" are displayed for inactive API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then Tag "API Details General" is displayed
        And Tag "API Details Rate Limit" is displayed
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"


    Scenario: 4) Can switch between "General" and "Rate Limit" tabs in "View API Details" of Inactive API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        When Tag "API Details General" is clickable
        Then I click Tag "API Details General"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"


    Scenario: 5) View "General" tab in "View API Details" of Inactive API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        And the value of Tag "API Details General Type" is "REST"
        And the value of Tag "API Details General Version" is "1.0.0"
        And the value of Tag "API Details General Authentication" is "Anonymous"
        And the value of Tag "API Details General Status" is "Inactive - Service not available"
        And the value of Tag "API Details General Managed URL" is "https://localhost:8243/t/0000s7.com/inactive_1/1.0.0"
        And the value of Tag "API Details General Description" is ""
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"


    Scenario: 6) Check "Rate Limit" tab in "View API Details" of active API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And the Tag "Enable API specific rate limit policy" is not checked
        And the Tag "API Details Allow" is disabled
        And the Tag "API Details requests, every" is disabled
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"


    Scenario: 7) "General" and "Rate Limit" tabs in "View API Details" are displayed for active API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then Tag "API Details General" is displayed
        And Tag "API Details Rate Limit" is displayed
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"


    Scenario: 8) Can switch between "General" and "Rate Limit" tabs in "View API Details" of active API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        When Tag "API Details General" is clickable
        Then I click Tag "API Details General"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"


    Scenario: 9) View "General" tab in "View API Details" of active API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        And the value of Tag "API Details General Type" is "REST"
        And the value of Tag "API Details General Version" is "1.0.0"
        And the value of Tag "API Details General Authentication" is "Anonymous"
        And the value of Tag "API Details General Status" is "Active - Service not available"
        And the value of Tag "API Details General Managed URL" is "https://localhost:8243/t/0000s7.com/inactive_2/1.0.0"
        And the value of Tag "API Details General Description" is ""
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"


    Scenario: 10) Check "Rate Limit" tab in "View API Details" of active API
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And the Tag "Enable API specific rate limit policy" is not checked
        And the Tag "API Details Allow" is disabled
        And the Tag "API Details requests, every" is disabled
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"


    Scenario: 11) Deactive API in row 2
        Given the grid "All Services" has many rows
        And the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        And  the value of Tag "~grid:row|2" contains "inactive_2"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "Deactivate"
        Then the value of Tag "~grid:cell|2;;Status" is "Inactive - Service not available"

