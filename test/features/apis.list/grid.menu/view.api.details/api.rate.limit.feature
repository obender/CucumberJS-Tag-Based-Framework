Feature: View API Details, Rate Limit - from the kebab options in "View API Details" view
    As a user
    I want to be able to view/update the specific Rate Limit (for an API)

    Pre-requisite:  3 Inactive api in api-list

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        When Tag "Explore" is clickable
        Then the grid "All Services" has many rows


    Scenario: init) Add 3 inactive API, 16 services and refresh the api.list section
        Given Postman collection "load.16.services" in folder "apis.list" is Executed successfully
        And  Postman collection "create.3.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: 1) Activate API in row 2
        Given the value of Tag "~grid:cell|2;;Status" is "Inactive - Service not available"
        And  the value of Tag "~grid:row|2" contains "inactive_2"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "Activate"
        Then the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"


    Scenario: 2) "General" and "Rate Limit" tabs in "View API Details" are displayed for inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then Tag "API Details General" is displayed
        And  Tag "API Details Rate Limit" is displayed
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 3) Click checkbox "Enable API specific rate limit policy - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        And  the Tag "API Details requests, every" is enabled
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 4) No update - "Enable API specific rate limit policy" and fill the textboxes - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "11111"
        And  I set Tag "API Details requests, every" to "66666"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 5) Update - "Enable API specific rate limit policy" and fill the textboxes - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "11111"
        And  I set Tag "API Details requests, every" to "66666"
        Then I click Tag "Update"
        When Tag "~confirm:button|Close" is clickable
        And  I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 6) Disable - "Enable API specific rate limit policy" - for Inactive API
        Given the grid "All Services" has many rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "API Details Allow" is enabled
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is disabled
        And  the Tag "API Details requests, every" is disabled
        Then I click Tag "Update"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 7) Make sure "Enable API specific rate limit policy - is disabled for Inactive API
        Given the grid "All Services" has many rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        When the Tag "Enable API specific rate limit policy" is not checked
        And  the Tag "API Details Allow" is disabled
        And  the Tag "API Details requests, every" is disabled
        And  Tag "~confirm:button|Close" is clickable
        Then I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        And  the grid "All Services" has many rows


#####   Active API #####

    Scenario: 8) "General" and "Rate Limit" tabs in "View API Details" are displayed for active API
        Given the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then Tag "API Details General" is displayed
        And  Tag "API Details Rate Limit" is displayed
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 9) Click checkbox "Enable API specific rate limit policy - for Active API
        Given the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        And  the Tag "API Details requests, every" is enabled
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 10) No update - "Enable API specific rate limit policy" and fill the textboxes - for Active API
        Given the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "22222"
        And  I set Tag "API Details requests, every" to "66666"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 11) Update - "Enable API specific rate limit policy" and fill the textboxes - for Active API
        Given the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "22222"
        And  I set Tag "API Details requests, every" to "66666"
        Then I click Tag "Update"
        When Tag "~confirm:button|Close" is clickable
        And  I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 12) Disable - "Enable API specific rate limit policy" - for Active API
        Given the grid "All Services" has many rows
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "API Details Allow" is enabled
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is disabled
        And  the Tag "API Details requests, every" is disabled
        Then I click Tag "Update"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 13) Make sure "Enable API specific rate limit policy - is disabled for Active API
        Given the grid "All Services" has many rows
        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        When the Tag "Enable API specific rate limit policy" is not checked
        And  the Tag "API Details Allow" is disabled
        And  the Tag "API Details requests, every" is disabled
        And  Tag "~confirm:button|Close" is clickable
        Then I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        And  the grid "All Services" has many rows

