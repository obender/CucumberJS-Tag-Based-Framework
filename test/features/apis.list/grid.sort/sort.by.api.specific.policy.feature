Feature: Sort by API Specific Policy
    As a user
    I want to be able to check the functionality of sorting by clicking on column "API Specific Policy":

    Pre-requisite:  1  Inactive api is in api-list
                    16 services are in api-list


    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable


    Scenario: init) Add 3 inactive API, 16 services and refresh the api.list section
        Given Postman collection "load.16.services" in folder "apis.list" is Executed successfully
        And Postman collection "create.3.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows
        And Tag "~grid:validateColumns|Name;Type;Status;Authentication;API Specific Policy;Description" is displayed

    Scenario: Create and Activate a managed API
        When I select option "All Services" in Tag "Filter"
        Then the grid "All Services" has any rows
        And  the value of Tag "~grid:row|10" is "Employee2|REST|Basic Auth|Secured REST service #2 of 0000s7"
        When I focus on Tag "~grid:row|10" and I Click Tag "~grid:menu|10" and I click on text "Create Managed API"
        Then the grid "All Services" has 19 rows
        And  the value of Tag "~grid:cell|10;;Status" is "Active"


    Scenario: 1) Update - "Enable API specific rate limit policy" and fill the textboxes - for Inactive API
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_1"
        When I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "11111"
        And  I set Tag "API Details requests, every" to "66666"
        Then I click Tag "Update"
        And  I click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 2) Update - "Enable API specific rate limit policy" and fill the textboxes - for Inactive API
        When I focus on Tag "~grid:row|3" and I Click Tag "~grid:menu|3" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "inactive_3"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "33333"
        And  I set Tag "API Details requests, every" to "66666"
        Then I click Tag "Update"
        And  I click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 3) Update - "Enable API specific rate limit policy" and fill the textboxes - for Inactive API
        # Symphony Bug workaround
        When I focus on Tag "~grid:row|9" and I Click Tag "~grid:row|9"
        When I focus on Tag "~grid:row|10" and I Click Tag "~grid:menu|10" and I click on text "View API Details"
        Then the value of Tag "API Details General Name" is "Employee2"
        When Tag "API Details Rate Limit" is clickable
        Then I click Tag "API Details Rate Limit"
        And  the Tag "Enable API specific rate limit policy" is not checked
        When I click Tag "Enable API specific rate limit policy"
        Then the Tag "API Details Allow" is enabled
        When I set Tag "API Details Allow" to "22222"
        And  I set Tag "API Details requests, every" to "66666"
        Then I click Tag "Update"
        And  I click Tag "~confirm:button|Close"
        Then the grid "All Services" has many rows


    Scenario: 4)Test if the sorting by "API Specific Policy" works in descending order
        When I click Tag "~grid:header|API Specific Policy"
        And I click Tag "~grid:sortMenu" and click text "API Specific Policy"
        Then the value of Tag "~grid:row|1" is "inactive_3|REST|Inactive - Service not available|Anonymous|33333 requests every 66666 ms"
        And the value of Tag "~grid:row|2" is "Employee2|REST|Active|Basic Auth|22222 requests every 66666 ms|Secured REST service #2 of 0000s7"
        And the value of Tag "~grid:row|3" is "inactive_1|REST|Inactive - Service not available|Anonymous|11111 requests every 66666 ms"
