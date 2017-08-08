Feature: View API Details, Rate Limit errors - from the kebab options in "View API Details" view
    As a user
    I want to be able to view all the error messages for a specific Rate Limit (for an API)

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


#    Scenario: 1) Activate API in row 2
#        Given the value of Tag "~grid:cell|2;;Status" is "Inactive - Service not available"
#        And  the value of Tag "~grid:row|2" contains "inactive_2"
#        When I focus on Tag "~grid:row|2" and I Click Tag "~grid:menu|2" and I click on text "Activate"
#        Then the value of Tag "~grid:cell|2;;Status" is "Active - Service not available"

# "API Details Allow" - validation

    Scenario: 2) Input text characters in enabled "API Details Allow" textbox - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "text"
        Then the value of Tag "~error:validation|API Details Allow" is "Enter a positive integer"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 3) Input negative number in enabled "API Details Allow" textbox - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "-1"
        Then the value of Tag "~error:validation|API Details Allow" is "Enter a positive integer"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 4) Input big number in enabled "API Details Allow" textbox - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "1000001"
        Then the value of Tag "~error:validation|API Details Allow" is "Max. limit is 1000000"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows

# "API Details requests, every" - validation

    Scenario: 5) Input text characters in enabled "API Details requests, every" textbox - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details requests, every" to "text"
        Then the value of Tag "~error:validation|API Details requests, every" is "Enter a positive integer"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 6) Input negative numbers in enabled "API Details requests, every" textbox - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details requests, every" to "-1"
        Then the value of Tag "~error:validation|API Details requests, every" is "Enter a positive integer"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 7) Input small number in enabled "API Details requests, every" textbox - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details requests, every" to "1"
        Then the value of Tag "~error:validation|API Details requests, every" is "Minimum time is 1000"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 8) Input big number in enabled "API Details requests, every" textbox - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details requests, every" to "86400001"
        Then the value of Tag "~error:validation|API Details requests, every" is "Maximum time is 86400000"
        And  Tag "~confirm:button|Close" is clickable
        When I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 9) No input in enabled textboxes - for Inactive API
        Given the value of Tag "~grid:cell|1;;Status" is "Inactive - Service not available"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to ""
        And  I set Tag "API Details requests, every" to ""
        And  I click Tag "Update"
        Then the value of Tag "~error:validation|API Details Allow" is "Enter a positive integer"
        And  the value of Tag "~error:validation|API Details requests, every" is "Enter a positive integer"
        When Tag "~confirm:button|Close" is clickable
        And  I focus on Tag "~confirm:button|Close" and I Click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


